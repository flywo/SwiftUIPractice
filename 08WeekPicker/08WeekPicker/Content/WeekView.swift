//
//  WeekView.swift
//  08WeekPicker
//
//  Created by yuhua on 2019/11/14.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    let title: String
    let tag: Int
    @Binding var current: Int
    var body: some View {
        Text(title)
            .padding()
            .onTapGesture {
                self.current = self.tag
        }
            .background(WeekViewSetter(tag: tag))
    }
}

struct WeekViewSetter: View {
    let tag: Int
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .preference(key: MyPreference.self,
                            value: [MyData(index: self.tag,
                                           rect: geometry.frame(in: .named("stack")))])
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(title: "星期一", tag: 1, current: .constant(1))
    }
}
