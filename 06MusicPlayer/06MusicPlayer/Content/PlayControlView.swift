//
//  PlayControlView.swift
//  06MusicPlayer
//
//  Created by yuhua on 2019/11/2.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct PlayControlView: View {
    @Binding var playModel: Int
    @Binding var isPlay: Bool
    @Binding var showList: Bool
    var upSelected: ()->Void
    var nextSelected: ()->Void
    var body: some View {
        HStack {
            Group {
                Spacer()
                Button(action: {
                    withAnimation {
                        self.playModel = (self.playModel+1)%2
                    }
                }) {
                    Image(systemName: playModel==1 ? "shuffle" : "repeat")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                Spacer()
            }
            Button(action: {
                self.upSelected()
            }) {
                Image("up")
            }
            Spacer()
            Button(action: {
                self.isPlay.toggle()
            }) {
                Image(isPlay ? "stop" : "play")
            }
            Spacer()
            Button(action: {
                self.nextSelected()
            }) {
                Image("next")
            }
            Spacer()
            Button(action: {
                self.showList = true
            }) {
                Image(systemName: "list.dash")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            Spacer()
        }.padding(.bottom, 10)
            .foregroundColor(.white)
    }
}
