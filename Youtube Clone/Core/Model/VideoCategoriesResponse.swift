//
//  VideoCategoriesResponse.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import Foundation

struct VideoCategoriesResponse: Decodable {
    var kind: String
    var items: [Item]
    
    struct Item: Decodable {
        var kind: String
        var id: String
        var snippet: Snippet?
        
        struct Snippet: Decodable {
            var title: String?
            var assignable: Bool?
            var channelId: String?
        }
    }
}
