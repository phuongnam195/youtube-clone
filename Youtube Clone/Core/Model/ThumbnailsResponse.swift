//
//  ThumbnailsResponse.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

struct ThumbnailsResponse: Decodable {
    var defaultThumb: Item?
    var mediumThumb: Item?
    var highThumb: Item?
    var standardThumb: Item?
    var maxresThumb: Item?
    
    struct Item: Decodable {
        var url: String
        var width: Int
        var height: Int
    }
    
    private enum CodingKeys: String, CodingKey {
            case defaultThumb = "default"
            case mediumThumb = "medium"
            case highThumb = "high"
            case standardThumb = "standard"
            case maxresThumb = "maxres"
        }
}
