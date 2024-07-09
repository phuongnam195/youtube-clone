//
//  ApiConstants.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

class ApiConstants {
    private init() {}
    
    static let apiKeyYoutube = "AIzaSyAoNQGU9ukbxrju-hISOCcflDbNWlv2GOc"
    static let apiKeyPexels = "9PY3kly5NKu5QUuOIzftXtIIQuZwtoLOLT0VqtgAmohNp8U5ovE8niWp"
    
    static let domainYoutube = "https://youtube.googleapis.com"
    static let domainPexels = "https://api.pexels.com"
    
    static let YOUTUBE_SEARCH = domainYoutube + "/youtube/v3/search"
    static let YOUTUBE_CHANNELS = domainYoutube + "/youtube/v3/channels"
    static let YOUTUBE_VIDEOS = domainYoutube + "/youtube/v3/videos"
    static let YOUTUBE_VIDEO_CATEGORIES = domainYoutube + "/youtube/v3/videoCategories"
    
    static let PEXELS_SEARCH_VIDEOS = domainPexels + "/videos/search"
}
