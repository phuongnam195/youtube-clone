//
//  ServiceRegistry.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 2/7/24.
//

import Foundation

let sl = ServiceLocator()

class ServiceRegistry {
    private init() {}
    
    static func registerAllServices() {
        sl.register(VideoRepository.self, with: VideoRepositoryImpl())
        sl.register(ChannelRepository.self, with: ChannelRepositoryImpl())
        sl.register(VideoCategoryRepository.self, with: VideoCategoryRepositoryImpl())
        sl.register(PexelsRepository.self, with: PexelsRepositoryImpl())
        
        sl.registerLazy { PlayingViewModel(sl.get(PexelsRepository.self)) }
        
        sl.registerLazy {
            HomeViewModel(sl.get(VideoCategoryRepository.self), sl.get(VideoRepository.self), sl.get(ChannelRepository.self))
        }
        
        sl.registerLazy {
            WatchingViewModel(sl.get(ChannelRepository.self))
        }
    }
}
