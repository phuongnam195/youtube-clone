//
//  Author.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import Foundation

struct Channel {
    let id: String
    let name: String
    let imageUrl: String
    let subcribers: Int
    
    static func fromResponse(_ model: ChannelsResponse.Item) -> Channel {
        return Channel(id: model.id ?? "", name: model.snippet?.title ?? "", imageUrl: model.snippet?.thumbnails.defaultThumb?.url ?? "", subcribers: Int(model.statistics?.subscriberCount ?? "") ?? 0)
    }
    
    static var dummies : [Channel] {
        return [
            Channel(id: "1", name: "Better Version", imageUrl: "https://picsum.photos/id/3287/200", subcribers: 343254),
            Channel(id: "2", name: "KARIK", imageUrl: "https://picsum.photos/id/93123/200", subcribers: 34849),
            Channel(id: "3", name: "Em Chè ĐTCL", imageUrl: "https://picsum.photos/id/49837/200", subcribers: 98540985),
        ]
    }
}
