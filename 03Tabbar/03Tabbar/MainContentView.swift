//
//  MainContentView.swift
//  03Tabbar
//
//  Created by yuhua on 2019/10/30.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct MainContentView: View {
    @State var title: String
    var body: some View {
        VStack {
            LinkImage(title: title)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView(title: "1")
    }
}
