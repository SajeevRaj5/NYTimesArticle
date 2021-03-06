//
//  ServiceManager.swift
//  NYTimesArticle
//
//  Created by Sajeev Raj on  4/3/19
//  Copyright © 2019 Sajeev. All rights reserved.
//

import Alamofire

class ServiceManager {

    static let shared = ServiceManager()
    
    var manager: Alamofire.SessionManager
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.default.session.configuration.httpAdditionalHeaders
        self.manager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return manager.request(urlRequest)
    }
}

extension ServiceManager {
    struct API {
        static var baseUrl: URL {
            return URL(string: "https://api.nytimes.com") ?? URL(fileURLWithPath: "")
        }
    }
}
