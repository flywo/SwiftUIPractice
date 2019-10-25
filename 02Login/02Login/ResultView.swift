//
//  ThirdLogin.swift
//  02Login
//
//  Created by yuhua on 2019/10/25.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    var viewType: Int
    var body: some View {
        var title = ""
        if viewType == 0 {
            title = "微信登录"
        } else if viewType == 1 {
            title = "QQ登录"
        } else if viewType == 2 {
            title = "微博登录"
        } else if viewType == 3 {
            title = "注册账号"
        } else if viewType == 4 {
            title = "找回密码"
        } else if viewType == 5 {
            title = "登录成功"
        }
        return Text(title+"页面")
            .navigationBarTitle(Text(title), displayMode: .inline)
            .navigationBarHidden(false)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewType: 1)
    }
}
