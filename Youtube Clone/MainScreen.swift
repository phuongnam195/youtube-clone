//
//  MainScreen.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI

struct MainScreen: View {
    private var _watchingVM = sl.get(WatchingViewModel.self)
    private var _playingVM = sl.get(PlayingViewModel.self)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                HomeScreen()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                ShortsScreen()
                    .tabItem {
                        Image(systemName: "arrow.down.left.arrow.up.right")
                        Text("Shorts")
                    }
                
                Text("")
                    .tabItem {
                        Image(systemName: "plus.circle")
                            .environment(\.symbolVariants, .none)
                    }
                
                Text("Subscribes")
                    .tabItem {
                        Image(systemName: "play.square.stack")
                        Text("Subscribes")
                    }
                    .environment(\.symbolVariants, .none)
                
                Text("You")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("You")
                    }
            }
            
            GeometryReader {
                let size = $0.size
                
                if _watchingVM.isShow {
                    WatchingScreen(size: size) {
                        _playingVM.stop()
                        withAnimation(.easeInOut(duration: 0.3), completionCriteria: .logicallyComplete) {
                            _watchingVM.isShow = false
                        } completion: {
                            _watchingVM.resetPosition()
                            _playingVM.video = nil
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainScreen()
}
