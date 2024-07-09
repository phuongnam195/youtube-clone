//
//  PlayingViewModel.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import Foundation
import AVKit
import Observation

@Observable 
class PlayingViewModel {
    private var _pexelsRepo: PexelsRepository
    
    init(_ pexelsRepo: PexelsRepository) {
        self._pexelsRepo = pexelsRepo
    }
    
    // MARK: - Control video player
    
    var player = AVPlayer()
    
    var video: Video?
    
    var isPlaying: Bool = false
    private var _playerObserver: NSKeyValueObservation?
    
    func setVideo(_ video: Video) async {
        self.video = video
        await createPlayer()
        player.play()
    }
    
    func createPlayer() async {
        if _playerObserver != nil {
            _playerObserver?.invalidate()
        }
        
        if video == nil {
            return
        }
        
        guard let url = await _findAltVideo(keyword: video!.name) else {
            return
        }
        
        player = AVPlayer(url: url)
        _playerObserver = player.observe(\.rate, options: [.new, .initial]) { [weak self] player, change in
            guard let self = self else { return }
            self.isPlaying = player.rate != 0
        }
    }
    
    func togglePlay() {
        isPlaying ? player.pause() : player.play()
    }
    
    func stop() {
        player.pause()
        _playerObserver?.invalidate()
        player.replaceCurrentItem(with: nil)
    }
    
    private func _findAltVideo(keyword: String) async -> URL?  {
        do {
            let response = try await _pexelsRepo.searchVideos(perPage: 1, keyword: keyword)
            if let videoFile = response.videos.first?.video_files.first {
                return URL(string: videoFile.link)
            }
        } catch {
            print(error)
        }
        return nil
    }
}
