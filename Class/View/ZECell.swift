//
//  ZECell.swift
//  XituVote
//
//  Created by 胡春源 on 16/3/21.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

class ZECell: UICollectionViewCell {
    var imageView:UIImageView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 初始化的时候把imageView添加到item上
        imageView = UIImageView(frame: self.bounds)
        imageView?.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        self.addSubview(imageView!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
