//
//  ContentView.swift
//  08WeekPicker
//
//  Created by yuhua on 2019/11/14.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var current = 0
    @State private var rects: [CGRect] = Array(repeating: CGRect.zero, count: 12)
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color.orange)
                .frame(width: rects[current].width, height: rects[current].height)
                .offset(x: rects[current].minX, y: rects[current].minY)
                .animation(.easeInOut(duration: 0.5))
            VStack {
                WeekView(title: "星期一", tag: 0, current: $current)
                WeekView(title: "星期二", tag: 1, current: $current)
                WeekView(title: "星期三", tag: 2, current: $current)
                WeekView(title: "星期四", tag: 3, current: $current)
                WeekView(title: "星期五", tag: 4, current: $current)
                WeekView(title: "星期六", tag: 5, current: $current)
                WeekView(title: "星期日", tag: 6, current: $current)
            }.onPreferenceChange(MyPreference.self) { preferences in
                for p in preferences {
                    self.rects[p.index] = p.rect
                }
            }
        }
            .border(Color.black)
            .coordinateSpace(name: "stack")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
