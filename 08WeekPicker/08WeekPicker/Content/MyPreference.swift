//
//  MyPreference.swift
//  08WeekPicker
//
//  Created by yuhua on 2019/11/14.
//  Copyright © 2019 yh. All rights reserved.
//

import Foundation
import SwiftUI

struct MyData: Equatable {
    let index: Int
    let rect: CGRect
}

struct MyPreference: PreferenceKey {
    typealias Value = [MyData]
    static var defaultValue: [MyData] = []
    static func reduce(value: inout [MyData], nextValue: () -> [MyData]) {
        value.append(contentsOf: nextValue())
    }
}
