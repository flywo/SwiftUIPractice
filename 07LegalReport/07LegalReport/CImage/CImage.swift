//
//  CImage.swift
//  07LegalReport
//
//  Created by yuhua on 2019/11/11.
//  Copyright © 2019 yh. All rights reserved.
//

import SwiftUI
import Kingfisher

extension UIActivityIndicatorView: Placeholder {
    public func add(to imageView: ImageView) {
        imageView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        heightAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    }
    
    public func remove(from imageView: ImageView) {
        removeFromSuperview()
    }
}

func CreateActivity() -> UIActivityIndicatorView {
    let activity = UIActivityIndicatorView(style: .medium)
    activity.color = .gray
    activity.startAnimating()
    return activity
}


struct CImage: UIViewRepresentable {
    var url: String
    func makeUIView(context: Context) -> CustomImageView {
        let imageView = CustomImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        return imageView
    }
    func updateUIView(_ uiView: CustomImageView, context: Context) {
        uiView.view.kf.setImage(with: URL(string: url), placeholder: CreateActivity())
    }
}

class CustomImageView: UIView {
    var view: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = UIImageView(frame: frame)
        addSubview(view)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


