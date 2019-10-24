//
//  SymbolDetail.swift
//  01SFSymbols
//
//  Created by yuhua on 2019/10/24.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct SymbolDetail: View {
    var symbol: String
    var body: some View {
        VStack {
            Image(systemName: symbol)
                .foregroundColor(Colors.randomElement())
                .imageScale(.large)
                .scaleEffect(3)
                .padding(.bottom, 100)
            Divider()
            Text(symbol)
                .font(.largeTitle)
        }
        .navigationBarTitle(symbol)
    }
}

struct SymbolDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SymbolDetail(symbol: "chevron.up")
        }
    }
}
