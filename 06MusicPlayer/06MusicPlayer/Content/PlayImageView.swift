//
//  PlayImageView.swift
//  06MusicPlayer
//
//  Created by yuhua on 2019/11/2.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct PlayImageView: View {
    @Binding var rotateAngle: Double
    var body: some View {
        Group{
            Spacer()
            ZStack {
                Image("musicimage")
                    .resizable()
                    .frame(width: screenWidth-80, height: screenWidth-80)
                Image("bg")
                    .resizable()
                    .frame(width: screenWidth-220, height: screenWidth-220)
                    .scaleEffect(1.5)
                    .clipped()
                    .cornerRadius((screenWidth-220)/2)
            }.rotationEffect(.degrees(rotateAngle))
            Spacer()
        }
    }
}
