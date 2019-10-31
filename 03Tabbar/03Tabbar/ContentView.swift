//
//  ContentView.swift
//  03Tabbar
//
//  Created by yuhua on 2019/10/30.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.green]
        UINavigationBar.appearance().tintColor = .green
//        UITabBar.appearance().barTintColor = UIColor.green
//        UITabBar.appearance().tintColor = .green
//        UITabBar.appearance().isHidden = true
    }
    @State var selectedTabbar = 3
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTabbar) {
                MainContentView(title: "1")
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("1")
                }.tag(0)
                MainContentView(title: "2")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("2")
                }.tag(1)
                MainContentView(title: "3")
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("3")
                }.tag(2)
                MainContentView(title: "4")
                    .tabItem {
                        Image(systemName: "4.circle")
                        Text("4")
                }.tag(3)
                MainContentView(title: "5")
                    .tabItem {
                        Image(systemName: "5.circle")
                        Text("5")
                }.tag(4)
            }
                .statusBar(hidden: false)
                .foregroundColor(.orange)
                .accentColor(.green)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
