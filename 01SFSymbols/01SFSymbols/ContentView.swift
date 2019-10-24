//
//  ContentView.swift
//  01SFSymbols
//
//  Created by yuhua on 2019/10/24.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        //修改导航栏文字颜色
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().tintColor = .orange
    }
    var body: some View {
        NavigationView {
            List(Symbols, id:\.self) {
                SymbolRow(symbol: $0)
            }
            .navigationBarTitle(Text("系统自带图片"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
