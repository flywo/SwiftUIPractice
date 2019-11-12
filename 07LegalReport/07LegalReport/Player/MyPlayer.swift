//
//  MyPlayer.swift
//  07LegalReport
//
//  Created by yuhua on 2019/11/12.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI
import AVKit

struct MyPlayerView: View {
    @State private var vURL = URL(string: "http://newcntv.qcloudcdn.com/asp/hls/2000/0303000a/3/default/cd32a52d7f384a6caeadb1e108ee065c/2000.m3u8")
    var body: some View {
        MyPlayer(videoURL: self.$vURL)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MyPlayer: UIViewControllerRepresentable {
    
    @Binding var videoURL: URL?

    private var player: AVPlayer {
        return AVPlayer(url: videoURL!)
    }
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.modalPresentationStyle = .fullScreen
        playerController.player = player
        playerController.player?.play()
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }
}
