//
//  VideoRepo.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

protocol VideoRepository {
    func getMostPopularVideos(maxResults: Int, categoryId: Int?, pageToken: String?, part: String) async throws -> VideosResponse
    func getVideoById(id: String, part: String) async throws -> VideosResponse.Item
}

extension VideoRepository {
    func getMostPopularVideos(maxResults: Int, categoryId: Int? = nil, pageToken: String? = nil, part: String = "snippet,contentDetails,statistics") async throws -> VideosResponse {
        return try await getMostPopularVideos(maxResults: maxResults, categoryId: categoryId, pageToken: pageToken, part: part)
    }
    
    func getVideoById(id: String, part: String = "snippet,contentDetails,statistics") async throws -> VideosResponse.Item {
        return try await getVideoById(id: id, part: part)
    }
}

struct VideoRepositoryImpl: VideoRepository {
    func getMostPopularVideos(maxResults: Int, categoryId: Int?, pageToken: String? = nil, part: String = "snippet,contentDetails,statistics") async throws -> VideosResponse {
        var params: [String: Any] = [
            "part": part,
            "maxResults": maxResults,
            "chart": "mostPopular",
            "regionCode": "VN",
            "key": ApiConstants.apiKeyYoutube,
        ]
        if let pageToken {
            params["pageToken"] = pageToken
        }
        if let categoryId {
            params["videoCategoryId"] = categoryId
        }
        let url = URL(base: ApiConstants.YOUTUBE_VIDEOS, params: params)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(VideosResponse.self, from: data)
        return result
    }
    
    func getVideoById(id: String, part: String = "snippet,contentDetails,statistics") async throws -> VideosResponse.Item {
        let params: [String: Any] = [
            "id": id,
            "part": part,
        ]
        let url = URL(base: ApiConstants.YOUTUBE_VIDEOS, params: params)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(VideosResponse.Item.self, from: data)
        return result
    }
}
