//
//  ContentView.swift
//  10ColorGame
//
//  Created by yuhua on 2019/11/15.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rFix = Double.random(in: 0..<1)
    let gFix = Double.random(in: 0..<1)
    let bFix = Double.random(in: 0..<1)
    @State var r: Double = 0.5
    @State var g: Double = 0.5
    @State var b: Double = 0.5
    @State var isShowResult = false
    var body: some View {
        VStack {
            Text("滑动对应RGB滑竿，然后确定！")
                .foregroundColor(.orange)
            Spacer()
            HStack {
                VStack {
                    Rectangle()
                        .frame(height: 300)
                    Text("随机颜色")
                }.foregroundColor(Color(red: rFix, green: gFix, blue: bFix))
                VStack {
                    Rectangle()
                        .frame(height: 300)
                    Text("猜想颜色")
                }.foregroundColor(Color(red: r, green: g, blue: b))
            }
            Spacer()
            Button(action: {
                self.isShowResult = true
            }) {
                Text("点击验证")
                    .frame(width: 200, height: 50)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.alert(isPresented: $isShowResult) { () -> Alert in
                    Alert(title: Text("您的得分"),
                          message: Text("\(computeScore())"),
                          dismissButton: .default(Text("好的")))
            }
            Spacer()
            Group {
                Text("\(Int(r*255))")
                    .foregroundColor(.red)
                Slider(value: $r)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .accentColor(.red)
                Text("\(Int(g*255))")
                    .foregroundColor(.green)
                Slider(value: $g)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .accentColor(.green)
                Text("\(Int(b*255))")
                    .foregroundColor(.blue)
                Slider(value: $b)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .accentColor(.blue)
            }
        }
    }
    func computeScore() -> Int {
        let rDiff = r - rFix
        let gDiff = g - gFix
        let bDiff = b - bFix
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
