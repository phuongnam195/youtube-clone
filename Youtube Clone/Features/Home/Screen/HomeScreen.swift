//
//  HomeScreen.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI

struct HomeScreen: View {
    private var _homeVM = sl.get(HomeViewModel.self)
    
    var body: some View {
        VStack {
            HomeHeaderBar()
            HomeCategoryBar(homeVM: _homeVM)
            HomeBody(homeVM: _homeVM, onTapVideo: {(video) in
                Task {
                    await sl.get(PlayingViewModel.self).setVideo(video)
                }
                withAnimation(.easeInOut(duration: 0.3)) {
                    sl.get(WatchingViewModel.self).isShow = true
                }
            })
        }
    }
}

#Preview {
    HomeScreen()
}
