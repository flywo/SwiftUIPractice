//
//  MusicData.swift
//  06MusicPlayer
//
//  Created by yuhua on 2019/11/2.
//  Copyright © 2019 yh. All rights reserved.
//

import Foundation

struct Music: Identifiable {
    var id: Int
    var musicNmae: String
    var musicLength: Double
    var musicSinger: String
    
    static func DemoData() -> [Music] {
        return [
            Music(id: 0, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 1, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 2, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 3, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 4, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 5, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 6, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 7, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 8, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 9, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 10, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 11, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 12, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 13, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 14, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣"),
            Music(id: 15, musicNmae: "他不准我哭", musicLength: 213, musicSinger: "邓丽欣")
        ]
    }
}
