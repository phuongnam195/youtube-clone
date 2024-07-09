//
//  WatchingScreen.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import SwiftUI
import AVKit

struct WatchingScreen: View {
    private var _watchingVM = sl.get(WatchingViewModel.self)
    private var _playingVM = sl.get(PlayingViewModel.self)
    
    var size: CGSize
    let onClose: () -> Void
    
    init(size: CGSize, onClose: @escaping () -> Void) {
        self.size = size
        self.onClose = onClose
    }
    
    let tabBarHeight = 56.0
    let miniPlayerHeight = 58.0
    let playerHeight: CGFloat = 180
    
    var body: some View {
        let progress = _watchingVM.progress > 0.7 ? (_watchingVM.progress - 0.7) / 0.3 : 0
        
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                GeometryReader {
                    let size = $0.size
                    let width = size.width - 120
                    let height = size.height
                    
                    VideoPlayingView()
                        .frame(
                            width: 120 + (width - (width * progress)),
                            height: height
                        )
                }
                
                MinimizedContent()
                    .padding(.leading, 130)
                    .padding(.trailing, 15)
                    .foregroundStyle(.primary)
                    .opacity(progress)
            }
            .frame(minHeight: miniPlayerHeight, maxHeight: playerHeight)
            .zIndex(1)
            
            ScrollView(.vertical) {
                if let video = _playingVM.video {
                    ExpandedContent(video)
                        .onAppear {
                            Task {
                                await _watchingVM.loadChannel(id: video.channelId)
                            }
                        }
                }
            }
            .opacity(1.0 - (_watchingVM.progress * 1.6))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.background)
        .clipped()
        .contentShape(.rect)
        .offset(y: _watchingVM.progress * -tabBarHeight)
        .frame(height: size.height - _watchingVM.position, alignment: .top)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    let start = value.startLocation.y
                    guard start < playerHeight || start > (size.height - (tabBarHeight + miniPlayerHeight)) else { return }
                    
                    let height = _watchingVM.lastPosition + value.translation.height
                    _watchingVM.position = min(height, (size.height - 50))
                    _generateProgress()
                }).onEnded({ value in
                    let start = value.startLocation.y
                    guard start < playerHeight || start > (size.height - (tabBarHeight + miniPlayerHeight)) else { return }
                    
                    let velocity = value.velocity.height * 5
                    withAnimation(.smooth(duration: 0.3)) {
                        if (_watchingVM.position + velocity) > (size.height * 0.65) {
                            _watchingVM.position = size.height - 50
                            _watchingVM.lastPosition = _watchingVM.position
                            _watchingVM.progress = 1
                        }
                        else {
                            _watchingVM.resetPosition()
                        }
                    }
                })
        )
        .transition(.offset(y: _watchingVM.progress == 1 ? tabBarHeight : size.height))
        .onChange(of: _playingVM.video, initial: false) { oldValue, newValue in
            withAnimation(.smooth(duration: 0.3)) {
                _watchingVM.resetPosition()
            }
        }
    }
    
    @ViewBuilder
    func MinimizedContent() -> some View {
        if let video = _playingVM.video {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(video.name)
                        .font(.system(size: 12))
                        .lineLimit(1)
                    
                    Text(video.channelName)
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                }
                
                Button(action: {
                    _playingVM.togglePlay()
                }) {
                    HStack {
                        Image(systemName: _playingVM.isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 18))
                    }
                    .frame(width: 36, height: UIConstants.minimizedBarHeight)
                    .background(.clear)
                }
                .foregroundStyle(.black)
                
                Button(action: onClose) {
                    HStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 18))
                    }
                    .frame(width: 36, height: UIConstants.minimizedBarHeight)
                    .background(.clear)
                }
                .foregroundStyle(.black)
                .padding(.horizontal, 5)
            }
        }
    }
    
    @ViewBuilder
    func ExpandedContent(_ video: Video) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(video.name)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .padding(.trailing, 10)
                    .padding(.bottom, 5)
                
                HStack {
                    Text(video.viewsString + "  " + video.createdAt.formatShort())
                        .font(.system(size: 14))
                    
                    Text("..." + String(localized: "See more").lowercased())
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                }
            }
            .padding(.top, 15)
            .padding(.horizontal, 10)
            .ignoresSafeArea(edges: .bottom)
            
            let channel = _watchingVM.channel
            
            HStack {
                NetworkImage(channel?.imageUrl, size: 30, circle: true)
                
                Text(channel?.name ?? "")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
                
                Text(channel?.subcribers.formatShort() ?? "")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button("Subscribe") {
                    
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .background(.black)
                .foregroundStyle(.white)
                .clipShape(Capsule())
            }
            .padding(10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func _generateProgress() {
        let progress = max(min(_watchingVM.position / (size.height - 50), 1.0), .zero)
        _watchingVM.progress = progress
    }
}
