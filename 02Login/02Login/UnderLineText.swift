//
//  UnderLineText.swift
//  02Login
//
//  Created by yuhua on 2019/10/25.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct UnderLineText: View {
    var text: String
    var body: some View {
        NavigationLink(destination: ResultView(viewType: text=="立即注册" ? 3 : 4)) {
        Text(text)
            .underline(true, color: .white)
            .foregroundColor(.white)
            .font(Font.system(size: 12))
            .padding(.top, 10)
        }
    }
}

struct UnderLineText_Previews: PreviewProvider {
    static var previews: some View {
        UnderLineText(text: "测试")
    }
}
