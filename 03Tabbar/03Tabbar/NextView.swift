//
//  NextView.swift
//  03Tabbar
//
//  Created by yuhua on 2019/10/30.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct NextView: View {
    var body: some View {
        Text("下一页")
            .navigationBarTitle(Text("下一页"), displayMode: .inline)
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
