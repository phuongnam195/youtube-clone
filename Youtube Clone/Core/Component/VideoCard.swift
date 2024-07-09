//
//  VideoCard.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 24/6/24.
//

import SwiftUI
import CachedAsyncImage

struct VideoCard: View {
    let video: Video
    let onTapMore: () -> Void
    
    var subtitle: String {
        return video.channelName + " · " + video.viewsString + " · " + video.createdAt.formatShort()
    }
    
    var body: some View {
        let videoWidth = UIScreen.main.bounds.width
        let videoHeight = videoWidth * 9 / 16
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
                NetworkImage(video.thumbnailUrl, width: videoWidth, height: videoHeight, cached: true)
                
                Text(video.durationString)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 6).fill(.black.opacity(0.6)))
                    .alignmentGuide(.bottom) { d in d[.bottom] + 8 }
                    .alignmentGuide(.trailing) { d in d[.trailing] + 8 }
            }
            .padding(.bottom, 3)
            
            HStack(alignment: .top, spacing: 0) {
                NetworkImage(video.channelImageUrl, size: 32, circle: true)
                    .padding(.horizontal, 10)
                    .padding(.top, 5)
                
                VStack(alignment: .leading) {
                    Text(video.name)
                        .lineLimit(2)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button("", systemImage: "ellipsis") {
                    onTapMore()
                }
                .padding(3)
                .foregroundStyle(.black)
                .rotationEffect(.degrees(-90))
                .padding(.trailing, 7)
                .padding(.top, 2)
            }
        }
        .padding(.bottom, 2)
    }
}

#Preview {
    VideoCard(video: Video.dummies.first!, onTapMore: { })
}
