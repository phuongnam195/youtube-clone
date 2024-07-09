//
//  NetworkImage.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 4/7/24.
//

import SwiftUI
import CachedAsyncImage

struct NetworkImage: View {
    let url: String?
    let width: Double
    let height: Double
    let circle: Bool
    let cached: Bool
    
    init(_ url: String?, width: Double, height: Double, cached: Bool = false) {
        self.url = url
        self.width = width
        self.height = height
        self.circle = false
        self.cached = cached
    }
    
    init(_ url: String?, size: Double, circle: Bool = false, cached: Bool = false) {
        self.url = url
        self.width = size
        self.height = size
        self.circle = circle
        self.cached = cached
    }
    
    private var radius: Double {
        return circle ? width / 2 : 0
    }
    
    var body: some View {
        if let url {
            if cached {
                self.cachedImage(url)
            }
            else {
                self.nonCachedImage(url)
            }
        } else {
            self.emptyView
        }
    }
    
    func nonCachedImage(_ url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .cornerRadius(radius)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: width, height: height)
                    .cornerRadius(radius)
            @unknown default:
                self.emptyView
            }
        }
    }
    
    func cachedImage(_ url: String) -> some View {
        CachedAsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .cornerRadius(radius)
            
        } placeholder: {
            ZStack {
                Color.clear
                ProgressView()
            }
            .frame(width: width, height: height)
        }
    }
    
    var emptyView: some View {
        EmptyView()
            .frame(width: width, height: height)
    }
}


#Preview {
    CircleNetworkImage(url: "https://picsum.photos/50", size: 30)
}
