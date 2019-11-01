//
//  MyCollectionViewCell.swift
//  04GridView
//
//  Created by yuhua on 2019/10/31.
//  Copyright © 2019 yh. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var iv: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageView = UIImageView(frame: contentView.bounds)
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        iv = imageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
