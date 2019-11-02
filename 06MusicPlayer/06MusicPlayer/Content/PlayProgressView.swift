//
//  PlayProgressView.swift
//  06MusicPlayer
//
//  Created by yuhua on 2019/11/2.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct PlayProgressView: View {
    @Binding var playValue: Double
    @Binding var music: Music
    init(playValue: Binding<Double>, music: Binding<Music>) {
        _playValue = playValue
        _music = music
        UISlider.appearance().tintColor = .white
    }
    var body: some View {
        HStack {
            Text("\(Int(playValue)/60):\(Int(playValue)%60, specifier: "%02d")")
            Slider(value: $playValue, in: 0...music.musicLength, step: 1)
            Text("\(Int(music.musicLength)/60):\(Int(music.musicLength)%60, specifier: "%02d")")
        }.foregroundColor(.white)
            .padding(.horizontal, 10)
    }
}
