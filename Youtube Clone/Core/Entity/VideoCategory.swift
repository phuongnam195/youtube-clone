//
//  VideoCategory.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import Foundation

struct VideoCategory: Hashable {
    let id: Int?
    let name: String
    let assignable: Bool
    
    static var all: VideoCategory {
        return VideoCategory(id: nil, name: "All", assignable: true)
    }
    
    static func fromResponse(_ model: VideoCategoriesResponse.Item) -> VideoCategory {
        return VideoCategory(id: Int(model.id), name: model.snippet?.title ?? "", assignable: model.snippet?.assignable ?? false)
    }
}
