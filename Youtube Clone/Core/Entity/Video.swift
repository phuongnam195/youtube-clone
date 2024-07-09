//
//  Video.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import Foundation

struct Video: Hashable {
    let id: String
    let name: String
    let channelId: String
    let channelName: String
    var channelImageUrl: String?
    var views: Int
    let createdAt: Date
    let thumbnailUrl: String
    let duration: Int
    let videoUrl: String?
    let width: Int?
    let height: Int?
    
    static func fromResponse(_ model: VideosResponse.Item) -> Video {
        return Video(id: model.id, name: model.snippet?.title ?? "", channelId: model.snippet?.channelId ?? "", channelName: model.snippet?.channelTitle ?? "", channelImageUrl: nil, views: Int(model.statistics?.viewCount ?? "0") ?? 0, createdAt: Date.fromServer(model.snippet?.publishedAt), thumbnailUrl: model.snippet?.thumbnails.standardThumb?.url ?? "", duration: model.contentDetails?.durationInSeconds ?? 0, videoUrl: nil, width: nil, height: nil)
    }
}

extension Video {
    var durationString: String {
        return Time(fromSeconds: duration).formatShort()
    }
    
    var viewsString: String {
        return String(localized: "\(views.formatShort()) views")
    }
}

extension Video {
    static var dummies: [Video] {
        return [
            Video(id: "10001", name: "Ngừng biến mình thành nô lệ của Dopamine tham lam | Sách The Molecule of More", channelId: "1", channelName: "Better Version", channelImageUrl: "https://picsum.photos/id/3287/200", views: 207_028, createdAt: Date.from(2024, 5, 11), thumbnailUrl: "https://i3.ytimg.com/vi/y8hhOBZDX7k/maxresdefault.jpg", duration: 1228, videoUrl: "https://www.youtube.com/watch?v=y8hhOBZDX7k", width: nil, height: nil),
            Video(id: "10002", name: "KARIK - NHẬT KÝ VÀO ĐỜI (FEAT. THAI VG) | OFFICIAL MUSIC VIDEO", channelId: "2", channelName: "KARIK", channelImageUrl: "https://picsum.photos/id/93123/200", views: 1_896_631, createdAt: Date.from(2024, 6, 20), thumbnailUrl: "https://i3.ytimg.com/vi/_hP8T3hcmoo/maxresdefault.jpg", duration: 243, videoUrl: "https://www.youtube.com/watch?v=_hP8T3hcmoo", width: nil, height: nil),
            Video(id: "10003", name: "NEEKO LÕI HOA RƠI VẪN LÀ MỘT CÁI GÌ ĐẤY ĐẾN TỪ EM CHÈ", channelId: "3", channelName: "Em Chè ĐTCL", channelImageUrl: "https://picsum.photos/id/49837/200", views: 139_186, createdAt: Date.from(2024, 6, 7), thumbnailUrl: "https://i3.ytimg.com/vi/ymWr8A1r6sk/maxresdefault.jpg", duration: 1491, videoUrl: "https://www.youtube.com/watch?v=ymWr8A1r6sk", width: nil, height: nil),
            Video(id: "10004", name: "KARIK - BẠN ĐỜI (FT. GDUCKY) | OFFICIAL MUSIC VIDEO", channelId: "2", channelName: "KARIK", channelImageUrl: "https://picsum.photos/id/93123/200", views: 93_920_469, createdAt: Date.from(2023, 10, 4), thumbnailUrl: "https://i3.ytimg.com/vi/h7cOOfpdEfk/maxresdefault.jpg", duration: 318, videoUrl: "https://www.youtube.com/watch?v=h7cOOfpdEfk", width: nil, height: nil),
        ]
    }
}
