//
//  PlayTitle.swift
//  06MusicPlayer
//
//  Created by yuhua on 2019/11/2.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct PlayTitle: View {
    @Binding var music: Music
    var body: some View {
        VStack {
            Text("\(music.id)-"+music.musicNmae)
                .foregroundColor(.white)
                .font(.system(size: 20))
            Text(music.musicSinger)
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
    }
}

struct PlayTitle_Previews: PreviewProvider {
    static var previews: some View {
        PlayTitle(music: .constant(Music(id: 0, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣")))
    }
}
