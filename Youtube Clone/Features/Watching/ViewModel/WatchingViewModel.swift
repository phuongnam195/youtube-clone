//
//  WatchingViewModel.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 4/7/24.
//

import Foundation

@Observable
class WatchingViewModel {
    private var _channelRepo: ChannelRepository
    
    init(_ channelRepo: ChannelRepository) {
        self._channelRepo = channelRepo
    }
    
    var channel: Channel?
    
    func loadChannel(id: String?) async {
        if (id == nil || channel != nil) {
            return
        }
        
        do {
            if let response = try await _channelRepo.getChannelById(id: id!) {
                channel = Channel.fromResponse(response)
            }
        } catch {
            print(error)
        }
    }
    
    // MARK: - Handle mini player (transition)
    
    var isShow: Bool = false
    
    var position: CGFloat = .zero
    var lastPosition: CGFloat = .zero
    var progress: CGFloat = .zero
    
    func resetPosition() {
        position = .zero
        lastPosition = .zero
        progress = .zero
    }
}
