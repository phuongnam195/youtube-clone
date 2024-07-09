//
//  PexelsRepository.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import Foundation

protocol PexelsRepository {
    func searchVideos(perPage: Int, keyword: String) async throws -> PexelsVideosResponse
}

struct PexelsRepositoryImpl: PexelsRepository {
    func searchVideos(perPage: Int, keyword: String) async throws -> PexelsVideosResponse {
        let params: [String: Any] = [
            "per_page": perPage,
            "query": keyword,
        ]
        
        var urlComponents = URLComponents(string: ApiConstants.PEXELS_SEARCH_VIDEOS)!
        urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.setValue(ApiConstants.apiKeyPexels, forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(PexelsVideosResponse.self, from: data)
        return result
    }
}
