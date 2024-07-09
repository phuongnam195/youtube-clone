//
//  HomeBody.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI
import AVKit

struct HomeBody: View {
    var homeVM: HomeViewModel
    
    var onTapVideo: ((Video) -> Void)?
    
    var body: some View {
        
        List {
            ForEach(homeVM.videos, id: \.self) { video in
                VideoCard(video: video, onTapMore: { } )
                    .onAppear {
                        Task {
                            await homeVM.loadChannelImage(video: video)
                        }
                    }
                    .onTapGesture {
                        onTapVideo?(video)
                    }
            }
            
            if !homeVM.isFull {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.black)
                    .foregroundColor(.red)
                    .onAppear {
                        Task {
                            await homeVM.loadMoreVideos()
                        }
                    }
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            Task {
                await homeVM.refreshVideos()
            }
        }
    }
}

#Preview {
    HomeBody(homeVM: HomeViewModel(VideoCategoryRepositoryImpl(), VideoRepositoryImpl(), ChannelRepositoryImpl()), onTapVideo: nil)
}
