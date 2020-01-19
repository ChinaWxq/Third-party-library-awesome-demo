//
//  CustomerCell.swift
//  UICollectionViewTest
//
//  Created by Ryan on 2020/1/19.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit
import CollectionViewSlantedLayout

class CustomerCell: CollectionViewSlantedCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.addSubview(imageView)
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.contentView.frame)
        return imageView
    }()
}
