//
//  NetworkError.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import Foundation

enum NetworkError: String, Error {
    
    
    case invalidURL
    case responseNot200
    case decodingFailed
    case noData
    case unknown
    
    var string: String {
        switch self{
            
        case .invalidURL:
            "Invalid URL! Please check your URL"
        case .responseNot200:
            "Response not 200! Please check your URL"
        case .decodingFailed:
            "Decoding Failed! Reload Struct or URL"
        case .noData:
            "Haven't data! Please try later"
        case .unknown:
            "Uknowned"
        }
    }
}
