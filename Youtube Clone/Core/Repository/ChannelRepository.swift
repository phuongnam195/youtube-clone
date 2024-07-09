//
//  ChannelRepository.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

protocol ChannelRepository {
    func getChannelById(id: String, part: String) async throws -> ChannelsResponse.Item?
}

extension ChannelRepository {
    func getChannelById(id: String, part: String = "snippet,statistics") async throws -> ChannelsResponse.Item? {
        return try await getChannelById(id: id, part: part)
    }
}

struct ChannelRepositoryImpl: ChannelRepository {
    func getChannelById(id: String, part: String = "snippet,statistics") async throws -> ChannelsResponse.Item? {
        let params: [String: Any] = [
            "id": id,
            "part": part,
            "key": ApiConstants.apiKeyYoutube,
        ]
        let url = URL(base: ApiConstants.YOUTUBE_CHANNELS, params: params)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let results = try JSONDecoder().decode(ChannelsResponse.self, from: data)
        return results.items.first
    }
}
