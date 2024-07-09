//
//  VideoCategoryRepository.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import Foundation

protocol VideoCategoryRepository {
    func getAllVideoCategories() async throws -> VideoCategoriesResponse
}

struct VideoCategoryRepositoryImpl: VideoCategoryRepository {
    func getAllVideoCategories() async throws -> VideoCategoriesResponse {
        let params: [String: Any] = [
            "part": "snippet",
            "regionCode": "VN",
            "hl": "vi",
            "key": ApiConstants.apiKeyYoutube,
        ]
        let url = URL(base: ApiConstants.YOUTUBE_VIDEO_CATEGORIES, params: params)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(VideoCategoriesResponse.self, from: data)
        return result
    }
}
