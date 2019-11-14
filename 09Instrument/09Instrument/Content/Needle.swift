//
//  Needle.swift
//  09Instrument
//
//  Created by yuhua on 2019/11/14.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct Needle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height/2))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}

