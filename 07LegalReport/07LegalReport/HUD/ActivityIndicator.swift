//
//  ActivityIndicator.swift
//  07LegalReport
//
//  Created by yuhua on 2019/11/11.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .white
        activity.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return activity
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}
