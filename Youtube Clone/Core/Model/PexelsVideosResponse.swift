//
//  PexelsVideosResponse.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import Foundation

struct PexelsVideosResponse: Decodable {
    var page: Int
    var videos: [Video]
    
    struct Video: Decodable {
        var id: Int
        var width: Int
        var height: Int
        var duration: Int
        var url: String
        var video_files: [VideoFile]
        
        struct VideoFile: Decodable {
            var id: Int
            var quality: String
            var file_type: String
            var width: Int
            var height: Int
            var fps: Double
            var link: String
            var size: Int
        }
    }
}
