//
//  LoginBtn.swift
//  02Login
//
//  Created by yuhua on 2019/10/25.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct LoginBtn: View {
    @State private var pushSuccess = false
    @State private var showFail = false
    var checkInput: ()->Bool
    var body: some View {
        NavigationLink(destination: ResultView(viewType: 5), isActive: $pushSuccess) {
            Button(action: {
                if self.checkInput() {
                    self.pushSuccess = true
                } else {
                    self.showFail = true
                }
            }) {
                Text("登录")
                    .frame(width: 200, height: 40)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(5)
            }
        }.alert(isPresented: $showFail) { () -> Alert in
            Alert(title: Text("抱歉"), message: Text("请输入正确的账号密码！"), dismissButton: .cancel(Text("我知道了！")))
        }
    }
}

struct LoginBtn_Previews: PreviewProvider {
    static var previews: some View {
        LoginBtn(checkInput: {false})
    }
}
