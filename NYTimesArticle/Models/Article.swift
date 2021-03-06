//
//  Article.swift
//  NYTimesArticle
//
//  Created by Sajeev Raj on  4/3/19
//  Copyright © 2019 Sajeev. All rights reserved.
//

import ObjectMapper
import Alamofire
import PromiseKit

class Article : Object {
    var url : URL?
    var author : String?
    var title : String?
    var publishedDate : String?
    
    override func mapping(map: Map) {
        
        url <- (map["url"],URLTransform())
        author <- map["byline"]
        title <- map["title"]
        publishedDate <- map["published_date"]
    }
}

extension Article {
    enum Router: Requestable {
        case list
        
        var method: Alamofire.HTTPMethod {
            return .get
        }
        
        var path: String {
            switch self {
            case .list: return "svc/mostpopular/v2/viewed/7.json"
            }
        }
        
        var parameters: Parameters? {
            switch self {
            case .list: return ["api-key":Constants.AppKey]
            }
        }
    }
}

extension Article {
    class ListResponse: Object {
        
        var articles: [Article]?
        
        override func mapping(map: Map) {
            articles <- map["results"]
        }
    }
}

extension Article {
    
    static func getList() -> Promise<[Article]> {
        return Promise { (resolver) in
            Router.list.request { (response: DataResponse<ListResponse>) in
               
                // error handling
                guard response.error == nil else {
                    resolver.reject(response.error!)
                    return
                }
                
                // get articles
                guard let values = response.value?.articles else {
                    let error = NSError(domain: "JSONResponseError", code: 3841, userInfo: nil)
                    resolver.reject(error)
                    return
                }
                
                // resolve to success
                resolver.fulfill(values)
            }
        }
    }
}
