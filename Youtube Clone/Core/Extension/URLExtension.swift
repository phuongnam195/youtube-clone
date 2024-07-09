//
//  URLExtension.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

extension URL {
    init?(base: String, params: [String: Any]) {
        var urlComponents = URLComponents(string: base)
        
        urlComponents?.queryItems = params.map { (key, value) in
            URLQueryItem(name: key, value: "\(value)")
        }
        
        if let url = urlComponents?.url {
            self = url
        } else {
            return nil
        }
    }
}
