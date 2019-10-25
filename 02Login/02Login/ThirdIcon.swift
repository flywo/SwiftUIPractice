//
//  ThirdIcon.swift
//  02Login
//
//  Created by yuhua on 2019/10/25.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct ThirdIcon: View {
    var imageName: String
    var thirdType: Int
    @State private var showAlert = false
    @State private var showPush = false
    var body: some View {
        NavigationLink(destination: ResultView(viewType: thirdType), isActive: $showPush) {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
            .opacity(0.8)
            .onTapGesture {
                self.showAlert = true
            }
            .alert(isPresented: $showAlert) { () -> Alert in
                var msg = ""
                if thirdType == 0 {
                    msg = "微信"
                } else if thirdType == 1 {
                    msg = "QQ"
                } else if thirdType == 2 {
                    msg = "微博"
                }
                return Alert(title: Text("提示"), message: Text("是否使用"+msg+"登录？"), primaryButton: .default(Text("好的"), action: {
                    print("跳转")
                    self.showPush = true
                }), secondaryButton: .cancel(Text("取消")))
            }
        }
    }
}

struct ThirdIcon_Previews: PreviewProvider {
    static var previews: some View {
        ThirdIcon(imageName: "2.circle", thirdType: 2)
    }
}
