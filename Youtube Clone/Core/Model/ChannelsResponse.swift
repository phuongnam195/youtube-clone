//
//  ChannelsResponse.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

struct ChannelsResponse: Decodable {
    var kind: String?
    var nextPageToken: String?
    var prevPageToken: String?
    var pageInfo: PageInfoResponse
    var items: [Item]
    
    struct Item: Decodable {
        var kind: String?
        var id: String?
        var snippet: Snippet?
        var statistics: Statistics?
        
        struct Snippet: Decodable {
            var title: String
            var description: String
            var customUrl: String
            var publishedAt: String
            var thumbnails: ThumbnailsResponse
        }
        
        struct Statistics: Decodable {
            var viewCount: String?
            var subscriberCount: String?
            var hiddenSubscriberCount: Bool
            var videoCount: String?
        }

    }
}

