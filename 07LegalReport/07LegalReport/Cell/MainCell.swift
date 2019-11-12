//
//  MainCell.swift
//  07LegalReport
//
//  Created by yuhua on 2019/11/11.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct MainCell: View {
    var video: Video
    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd HH:mm"
           return formatter
       }
//    var isFirst: Bool
    var body: some View {
        ZStack {
//            if isFirst {
//                GeometryReader {
//                    self.makeFirstView(geometry: $0)
//                }
//            }
            HStack {
                CImage(url: video.image1)
                    .frame(width: 150, height: 100)
                VStack {
                    Spacer()
                    Text(video.title)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(Date(timeIntervalSince1970: Double(video.pubTime/1000)), formatter: dateFormatter)")
                            .font(.system(size: 14))
                    }
                }.padding(.leading, 5)
            }
        }
    }
    
    func makeFirstView(geometry: GeometryProxy) -> some View {
        print("FirstCell\(geometry.frame(in: .global))")
        return Rectangle().foregroundColor(.white)
    }
}

struct MainCell_Previews: PreviewProvider {
    static var previews: some View {
        MainCell(video: Video(vduration: 16,
                              pubTime: 13,
                              likeCount: 0,
                              mediaId: "11",
                              title: "《今日说法》 20191111 玩火的孩子",
                              cateName: "",
                              allowShare: 0,
                              vcount: 0,
                              mediaName: "今日说法",
                              seqId: 0,
                              allowAd: 0,
                              isSubed: 0,
                              allowComment: 0,
                              image1: "http://p4.img.cctvpic.com/fmspic/2019/11/11/e8a6318d1ac042a39959b880ba8eadf6-850.jpg",
                              image2: "http://p4.img.cctvpic.com/fmspic/2019/11/11/e8a6318d1ac042a39959b880ba8eadf6-850.jpg",
                              commentCount: 0,
                              mediaImg: "http://p2.img.cctvpic.com/apple3g/www/upload/image/20170815/1502766624088099537.png",
                              guid: "dd"))
    }
}
