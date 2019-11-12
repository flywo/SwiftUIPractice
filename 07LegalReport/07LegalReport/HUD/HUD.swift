//
//  HUD.swift
//  07LegalReport
//
//  Created by yuhua on 2019/11/11.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct HUD: View {
    let title: String
    var body: some View {
        GeometryReader { _ in
            ZStack {
                ActivityIndicator()
                Text(self.title)
                    .font(.system(size: 18))
                    .offset(y: 50)
                    .foregroundColor(.white)
            }.frame(width: 150, height: 150)
                .background(Color.gray)
                .cornerRadius(20)
        }.background(Color.black.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
    }
}

struct HUD_Previews: PreviewProvider {
    static var previews: some View {
        HUD(title: "测试")
    }
}
