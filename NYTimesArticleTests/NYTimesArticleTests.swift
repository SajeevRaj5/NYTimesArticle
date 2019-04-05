//
//  NYTimesArticleTests.swift
//  NYTimesArticleTests
//
//  Created by Sajeev Raj on  4/3/19
//  Copyright © 2019 Sajeev. All rights reserved.
//

import XCTest
@testable import NYTimesArticle

class NYTimesArticleTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testArticleData() {
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=khv7rDY89ipce7GPtF3DGKL27Mi81c3h") else {
            XCTAssert(false)
            return
        }
        
        let promise = expectation(description: "Simple Request")
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                XCTAssertNil(json as? NSDictionary, "Could not get a dictionary results")
                
                if let result = json as? NSDictionary, let articles = result["results"] as? NSArray {
                    
                    // check if the api returns value
                    XCTAssertTrue(articles.count > 0)
                    promise.fulfill()
                    
                } else {
                    XCTAssert(false)
                }
                
            } catch let error {
                XCTAssertThrowsError(error)
                XCTAssert(false)
            }
            
            }.resume()
        waitForExpectations(timeout: 20, handler: nil)
    }
}
