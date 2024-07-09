//
//  VideosResponse.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

struct VideosResponse: Decodable {
    var kind: String
    var nextPageToken: String?
    var prevPageToken: String?
    var pageInfo: PageInfoResponse
    var items: [Item]
    
    struct Item: Decodable {
        var kind: String
        var id: String
        var snippet: Snippet?
        var contentDetails: ContentDetails?
        var statistics: Statistics?
        
        struct Snippet: Decodable {
            var publishedAt: String
            var channelId: String
            var title: String
            var description: String
            var thumbnails: ThumbnailsResponse
            var channelTitle: String
        }
        
        struct ContentDetails: Decodable {
            var duration: String
            var dimension: String
            var definition: String
            var caption: String
            var licensedContent: Bool
            var projection: String
            
            var durationInSeconds: Int {
                var sH = duration.firstMatch(pattern: "\\d+H") ?? "0H"
                var sM = duration.firstMatch(pattern: "\\d+M") ?? "0M"
                var sS = duration.firstMatch(pattern: "\\d+S") ?? "0S"
                sH.removeLast()
                sM.removeLast()
                sS.removeLast()
                let h = Int(sH) ?? 0
                let m = Int(sM) ?? 0
                let s = Int(sS) ?? 0
                return h * 3600 + m * 60 + s
            }
        }
        
        struct Statistics: Decodable {
            var viewCount: String?
            var likeCount: String?
            var favoriteCount: String?
            var commentCount: String?
        }

    }
}
