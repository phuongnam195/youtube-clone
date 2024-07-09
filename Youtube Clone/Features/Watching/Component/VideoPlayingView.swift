//
//  VideoPlayingView.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import SwiftUI
import AVKit

struct VideoPlayingView: View {
    private var _playingVM = sl.get(PlayingViewModel.self)
    
    var body: some View {
        VideoPlayer(player: _playingVM.player)
            .clipped()
    }
}
