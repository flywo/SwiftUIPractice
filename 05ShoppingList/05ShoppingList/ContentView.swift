//
//  ContentView.swift
//  05ShoppingList
//
//  Created by yuhua on 2019/11/1.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .orange
        UITableViewCell.appearance().backgroundColor = .clear
    }
    let data = ShoppingData.demoData()
    var body: some View {
        List(data) {
            ShoppingCell(data: $0)
        }.listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone 11"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
