//
//  ContentView.swift
//  09Instrument
//
//  Created by yuhua on 2019/11/14.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 45.0
    var body: some View {
        VStack {
            Instrument(value: $value)
            Slider(value: $value, in: 0...200, step: 1)
                .padding(.horizontal, 20)
            HStack {
                Spacer()
                Button(action: {
                    self.value = 0
                }) {
                    Text("最小值")
                }.foregroundColor(.blue)
                Spacer()
                Button(action: {
                    self.value = 200
                }) {
                    Text("最大值")
                }.foregroundColor(.blue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
