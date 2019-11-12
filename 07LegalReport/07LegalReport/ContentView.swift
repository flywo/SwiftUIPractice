//
//  ContentView.swift
//  07LegalReport
//
//  Created by yuhua on 2019/11/11.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var isShowHud = false
    @State var videoList = [Video]()
    @State var page = 1
    var body: some View {
        ZStack {
            NavigationView {
                if self.videoList.isEmpty {
                    Text("无数据！")
                        .font(.system(size: 20))
                        .foregroundColor(.orange)
                } else {
                    List {
                        ForEach(self.videoList, id: \.pubTime) { video in
                            NavigationLink(destination: MyPlayerView().navigationBarTitle(video.title)) {
                                MainCell(video: video)
                            }
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                self.requestData()
                            }) {
                                Text("点击加载更多")
                            }.buttonStyle(PlainButtonStyle())
                                .foregroundColor(.orange)
                            Spacer()
                        }
                    }.navigationBarTitle("今日说法", displayMode: .inline)
                }
            }.onAppear {
                self.requestData()
                UINavigationBar.appearance().tintColor = .black
            }
            if isShowHud {
                HUD(title: "加载中...")
            }
        }
    }
    
    func requestData() {
        self.isShowHud = true
        let request = Net.getVideoList(page: self.page, success: { videos in
            self.isShowHud = false
            self.page += 1
            self.videoList.append(contentsOf: videos)
        })
        Timer.scheduledTimer(withTimeInterval: 8, repeats: false, block: { timer in
            timer.invalidate()
            request?.cancel()
            self.isShowHud = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
