//
//  SymbolRow.swift
//  01SFSymbols
//
//  Created by yuhua on 2019/10/24.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct SymbolRow: View {
    var symbol: String
    var body: some View {
        NavigationLink(destination: SymbolDetail(symbol: symbol)) {
            HStack {
                //图片
                Image(systemName: symbol)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Colors.randomElement())
                //分割
                Divider()
                Spacer()
                //文字
                Text(symbol)
                Spacer()
            }
        }
    }
}

struct SymbolRow_Previews: PreviewProvider {
    static var previews: some View {
        SymbolRow(symbol: "chevron.up")
    }
}
