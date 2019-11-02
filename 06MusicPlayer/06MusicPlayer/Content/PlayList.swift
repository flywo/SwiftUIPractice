//
//  PlayList.swift
//  06MusicPlayer
//
//  Created by yuhua on 2019/11/2.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct PlayList: View {
    @Binding var showList: Bool
    var selected: (Int)->Void
    var body: some View {
        VStack {
            Text("播放列表")
            List {
                //这次使用ForEach来实现List
                ForEach(Music.DemoData()) { item in
                    Button(action: {
                        self.selected(item.id)
                    }) {
                        HStack {
                            Text("\(item.id) ")
                                .foregroundColor(.orange)
                                .font(.system(size: 20))
                            +
                                Text("\(item.musicNmae)")
                                    .font(.system(size: 20))
                            +
                                Text(" - \(item.musicSinger)")
                                    .font(.system(size: 16))
                            Spacer()
                        }
                    }
                }
            }
            Button(action: {
                self.showList = false
            }) {
                Text("返回")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40)
                    .background(Color.orange)
                    .cornerRadius(5)
            }
        }
    }
}

