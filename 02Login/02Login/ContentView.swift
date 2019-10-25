//
//  ContentView.swift
//  02Login
//
//  Created by yuhua on 2019/10/24.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var pass = ""
    @State private var choice = false
    @State private var pushSuccess = false
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().tintColor = .orange
    }
    var body: some View {
        NavigationView {
        VStack {
            Group {
                Image(systemName: "location.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .opacity(0.5)
            }
            Spacer()
            Group {
                HStack {
                    Spacer().frame(width: 40)
                    TextField("输入账号", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                    Spacer().frame(width: 40)
                }
                HStack {
                    Spacer().frame(width: 40)
                    TextField("输入密码", text: $pass)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                        
                    Spacer().frame(width: 40)
                }
            }
            Spacer()
            Group {
                HStack {
                    Button(action: {
                        self.choice.toggle()
                    }) {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(choice ? .orange : .white)
                    }
                        .buttonStyle(PlainButtonStyle())
                    Text("记住登录密码")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                }
                
                NavigationLink(destination: ResultView(viewType: 5), isActive: $pushSuccess) {
                    Button(action: {
                        self.pushSuccess = true
                    }) {
                        Text("登录")
                            .frame(width: 200, height: 40)
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(5)
                    }
                }
                HStack {
                    Spacer()
                    UnderLineText(text: "立即注册")
                    Spacer()
                    UnderLineText(text: "忘记密码")
                    Spacer()
                }
            }
            Spacer()
            Group {
                Text("没有账号？点击快速登录！")
                    .foregroundColor(.white)
                    .font(Font.system(size: 14))
                HStack {
                    ThirdIcon(imageName: "0.circle", thirdType: 0)
                    ThirdIcon(imageName: "1.circle", thirdType: 1).padding(.horizontal, 40)
                    ThirdIcon(imageName: "2.circle", thirdType: 2)
                }
                .padding(.top, 10)
            }
            Spacer()
                .frame(height: 20)
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Image("bg")
            .resizable()
            .edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone11"], id: \.self) { deviceName in
//        ForEach(["iPhone 8", "iPhone 11"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
