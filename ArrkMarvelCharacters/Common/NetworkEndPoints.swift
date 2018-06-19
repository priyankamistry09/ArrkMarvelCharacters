//
//  NetworkEndPoints.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

import Foundation

protocol NetworkEndPoints {
    var path: String { get }
    var url: String { get }
}

struct API {
    static let baseUrl = "https://gateway.marvel.com:443"
    static let apiKey = "10aee2d5b3d431136198d6d616c5a4ec"
    static let hash = "a16cc1d1e08699703827f31d85bdfe6c"
    static let ts = "1529326818"
}
enum EndPoints {
    
    enum Characters: NetworkEndPoints {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/v1/public/characters"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)?apikey=\(API.apiKey)&hash=\(API.hash)&ts=\(API.ts)"
            }
        }
    }
}
