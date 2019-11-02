//
//  MusicView.swift
//  06MusicPlayer
//
//  Created by yuhua on 2019/11/2.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width

struct MusicView: View {
    
    //是否在播放
    @State private var isPlay = false
    //旋转角度
    @State private var rotateAngle: Double = 0
    //定时器
    private let time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //播放模式
    @State private var playModel = 0
    //播放进度
    @State private var playValue: Double = 0
    //是否弹出列表
    @State private var showList = false
    //正在播放的歌曲
    @State private var currentMusic: Music = Music.DemoData().first!
    
    var body: some View {
        VStack {
            //歌名
            PlayTitle(music: $currentMusic)
            //图片
            PlayImageView(rotateAngle: $rotateAngle)
            //播放进度
            PlayProgressView(playValue: $playValue, music: $currentMusic)
            //播放控制
            PlayControlView(playModel: $playModel,
                            isPlay: $isPlay,
                            showList: $showList,
                            upSelected: {
                                self.playModel == 0 ? self.upMusic() : self.randomNextMusic()
            },
                            nextSelected: {
                                self.playModel == 0 ? self.nextMusic() : self.randomNextMusic()
            })
        }
            //设置界面平铺
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            //背景
        .background(
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .blur(radius: 100, opaque: true)
        )
            //计时
        .onReceive(time) { _ in
                if self.isPlay {
                    withAnimation(.linear(duration: 1)) {
                        self.rotateAngle += 30
                        self.playValue += 1
                        if self.playValue == self.currentMusic.musicLength {
                            self.playModel == 0 ? self.nextMusic() : self.randomNextMusic()
                        }
                    }
                }
        }
            //弹出列表
        .sheet(isPresented: $showList) {
            PlayList(showList: self.$showList, selected: {
                self.playMusic(num: $0)
            })
        }
    }
    
    //上一曲
    func upMusic() {
        if currentMusic.id == 0{
            currentMusic = Music.DemoData().last!
        } else {
            currentMusic = Music.DemoData()[currentMusic.id-1]
        }
        rebootData()
    }
    
    //下一曲
    func nextMusic() {
        if currentMusic.id == Music.DemoData().count-1{
            currentMusic = Music.DemoData().first!
        } else {
            currentMusic = Music.DemoData()[currentMusic.id+1]
        }
        rebootData()
    }
    
    //随机一曲
    func randomNextMusic() {
        currentMusic = Music.DemoData().randomElement()!
        rebootData()
    }
    
    //播放指定歌曲
    func playMusic(num: Int) {
        currentMusic = Music.DemoData()[num]
        rebootData()
    }
    
    //重置界面数据
    func rebootData() {
        self.isPlay = true
        self.rotateAngle = 0
        self.playValue = 0
        self.showList = false
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
