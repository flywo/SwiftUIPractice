//
//  LinkImage.swift
//  03Tabbar
//
//  Created by yuhua on 2019/10/30.
//  Copyright © 2019 余华. All rights reserved.
//

import SwiftUI

struct LinkImage: View {
    @State var title: String
    var body: some View {
        NavigationLink(destination: NextView()) {
            Image(systemName: title+".circle")
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
}

struct LinkImage_Previews: PreviewProvider {
    static var previews: some View {
        LinkImage(title: "1")
    }
}
