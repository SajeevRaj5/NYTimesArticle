//
//  NYTimesArticleUITests.swift
//  NYTimesArticleUITests
//
//  Created by Sajeev Raj on  4/3/19
//  Copyright © 2019 Sajeev. All rights reserved.
//

import XCTest

class NYTimesArticleUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testClickArticleCell() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let count = tablesQuery.cells.count
        let exists = NSPredicate(format: "count >= 0")
        
        // wait fo the api resoponse for 10 sec
        expectation(for: exists, evaluatedWith: tablesQuery, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        // get the page title
        let detailsPageIdentifier = app.descendants(matching: .navigationBar).element.identifier
        
        // select each article, go to the details and come back to article listing
        for index in 0..<tablesQuery.cells.count {
            // in listing page
            tablesQuery.cells.element(boundBy: index).tap()
            
            // in details page
            let nyTimesMostPopularButton = app.navigationBars[detailsPageIdentifier].buttons[detailsPageIdentifier]
            
            // go to previous listing screen
            nyTimesMostPopularButton.tap()
        }
    }
}
