//
//  ContentView.swift
//  04GridView
//
//  Created by yuhua on 2019/10/31.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //数据快照
    @State private var shapshot: NSDiffableDataSourceSnapshot<Int, Model> = {
        var shapshot = NSDiffableDataSourceSnapshot<Int, Model>()
        shapshot.appendSections([0])
        return shapshot
    }()
    //数据为空时弹窗
    @State private var showEmptyAlert = false
    //是否删除数据弹窗
    @State private var showDeleteSure = false
    //删除数据下标
    @State private var selected = 0
    
    var body: some View {
        VStack {
            MyCollectionView(shapshot: $shapshot, showDelete: $showDeleteSure, selected: { num in
                self.selected = num
            }).alert(isPresented: $showDeleteSure) { () -> Alert in
                Alert(title: Text("注意"), message: Text("是否要删除\(selected+1)这个方格？"), primaryButton: .default(Text("是的"), action: {
                    self.shapshot.deleteItems([self.shapshot.itemIdentifiers[self.selected]])
                }), secondaryButton: .cancel(Text("算了")))
            }
            Divider()
            HStack {
                Spacer()
                Button("添加方格") {
                    self.shapshot.appendItems([Model(id: self.shapshot.numberOfItems+1)], toSection: 0)
                }
                Spacer()
                Button("删除方格") {
                    guard !self.shapshot.itemIdentifiers.isEmpty else {
                        self.showEmptyAlert = true
                        return
                    }
                    self.shapshot.deleteItems([self.shapshot.itemIdentifiers.last!])
                }.alert(isPresented: $showEmptyAlert) { () -> Alert in
                    Alert(title: Text("注意"), message: Text("已经没用内容可以删除！"), dismissButton: .cancel(Text("我知道了")))
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
