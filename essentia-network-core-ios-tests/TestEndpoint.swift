//
//  TestEndpoint.swift
//  essentia-network-core-ios-tests
//
//  Created by Pavlo Boiko on 15.09.18.
//  Copyright © 2018 Essentia-One. All rights reserved.
//

import Foundation

enum TestEndpoint: RequestProtocol {
    var path: String {
        return "/todos/1"
    }
    
    var extraHeaders: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var requestType: RequestType {
        return .get
    }
    
    var contentType: RequestContentType {
        return .json
    }
    
    case one
}
