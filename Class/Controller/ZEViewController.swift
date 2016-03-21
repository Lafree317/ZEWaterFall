//
//  XTVoteViewController.swift
//  XituVote
//
//  Created by 胡春源 on 16/3/21.
//  Copyright © 2016年 胡春源. All rights reserved.
//

import UIKit

class ZEViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout {
    
    var collectionView:UICollectionView?
    var layout = CHTCollectionViewWaterfallLayout()
    var dataArr:Array<ZEModel> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // CHT方法
        // 上下左右间距
        layout.sectionInset = UIEdgeInsetsMake(5, 5,5, 5)
        // 横向行数
        layout.columnCount = 2
        // item左右间距
        layout.minimumColumnSpacing = 5;
        // item 上下间距
        layout.minimumInteritemSpacing = 5;
        // collection初始化
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        // 注册cell
        collectionView?.registerClass(ZECell.self, forCellWithReuseIdentifier: "ZECell")
        self.view.addSubview(collectionView!)
        self.setDate()
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ZECell", forIndexPath: indexPath) as! ZECell
        let model = dataArr[indexPath.row]
        // SDWeb赋值图片
        cell.imageView?.sd_setImageWithURL(NSURL(string: model.imageUrl!), completed: { (image, error, cache, url) -> Void in
            if image != nil {
                // 给model赋值Size
                if (!CGSizeEqualToSize(model.imageSize, image.size)){
                    model.imageSize = image.size
                    collectionView.reloadItemsAtIndexPaths([indexPath])
                }
            }
        })
        return cell
    }
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        // 返回item大小
        let model = dataArr[indexPath.row]
        // 默认收起状态
        if !model.isShou{
            if (!CGSizeEqualToSize(model.imageSize, CGSizeZero)){
                return model.imageSize
            }else{
                return model.defaultSize
            }
        }else{
            return model.defaultSize
        }
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // 点击事件打开item
        let model = dataArr[indexPath.row]
        model.isShou = !model.isShou
        collectionView.reloadItemsAtIndexPaths([indexPath])
        
    }

    func setDate(){
        // 模拟网络请求
        let arr:Array<String> = [
            "http://g.hiphotos.baidu.com/image/w%3D310/sign=6f9ce22079ec54e741ec1c1f89399bfd/9d82d158ccbf6c81cea943f6be3eb13533fa4015.jpg",
            "http://b.hiphotos.baidu.com/image/pic/item/4bed2e738bd4b31cc6476eb985d6277f9e2ff8bd.jpg",
            "http://c.hiphotos.baidu.com/image/pic/item/94cad1c8a786c9174d18e030cb3d70cf3bc7579b.jpg",
            "http://e.hiphotos.baidu.com/image/w%3D310/sign=79bc1b1a950a304e5222a6fbe1c9a7c3/d1160924ab18972b50a46fd4e4cd7b899e510a15.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D310/sign=05e2c867272dd42a5f0907aa333a5b2f/7dd98d1001e93901f3f7103079ec54e737d196c3.jpg",
            "http://e.hiphotos.baidu.com/image/w%3D310/sign=3914596cf1deb48ffb69a7dfc01e3aef/d0c8a786c9177f3ea3e73f0072cf3bc79e3d56e8.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D310/sign=8cc67b8cc91349547e1eee65664e92dd/4610b912c8fcc3ce11e40a3e9045d688d43f2093.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D310/sign=93e1c429952bd40742c7d5fc4b889e9c/3812b31bb051f8191cdd594bd8b44aed2e73e733.jpg",
            "http://b.hiphotos.baidu.com/image/pic/item/4bed2e738bd4b31cc6476eb985d6277f9e2ff8bd.jpg",
            "http://c.hiphotos.baidu.com/image/pic/item/94cad1c8a786c9174d18e030cb3d70cf3bc7579b.jpg",
            "http://e.hiphotos.baidu.com/image/w%3D310/sign=3914596cf1deb48ffb69a7dfc01e3aef/d0c8a786c9177f3ea3e73f0072cf3bc79e3d56e8.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D310/sign=93e1c429952bd40742c7d5fc4b889e9c/3812b31bb051f8191cdd594bd8b44aed2e73e733.jpg",
            "http://e.hiphotos.baidu.com/image/w%3D310/sign=d4507def9d3df8dca63d8990fd1072bf/d833c895d143ad4b758c35d880025aafa40f0603.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D310/sign=702acce2552c11dfded1b92253266255/d62a6059252dd42a3ac70aaa013b5bb5c8eab8e0.jpg",
            "http://h.hiphotos.baidu.com/image/w%3D310/sign=75ff59cd19d5ad6eaaf962ebb1ca39a3/b64543a98226cffcb9f3ddbbbb014a90f703eada.jpg",
            "http://e.hiphotos.baidu.com/image/w%3D310/sign=11386163f1deb48ffb69a7dfc01e3aef/d0c8a786c9177f3e8bcb070f72cf3bc79f3d5631.jpg",
            "http://f.hiphotos.baidu.com/image/w%3D310/sign=8ed508bbd358ccbf1bbcb33b29d8bcd4/8694a4c27d1ed21b33ff8fecaf6eddc451da3f80.jpg",
            "http://b.hiphotos.baidu.com/image/w%3D310/sign=ad40ca82c9ef76093c0b9f9e1edca301/5d6034a85edf8db16aa7b27b0b23dd54564e7420.jpg",
            "http://e.hiphotos.baidu.com/image/w%3D310/sign=79bc1b1a950a304e5222a6fbe1c9a7c3/d1160924ab18972b50a46fd4e4cd7b899e510a15.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D310/sign=05e2c867272dd42a5f0907aa333a5b2f/7dd98d1001e93901f3f7103079ec54e737d196c3.jpg",
            "http://g.hiphotos.baidu.com/image/w%3D310/sign=6f9ce22079ec54e741ec1c1f89399bfd/9d82d158ccbf6c81cea943f6be3eb13533fa4015.jpg",
            "http://e.hiphotos.baidu.com/image/w%3D310/sign=79bc1b1a950a304e5222a6fbe1c9a7c3/d1160924ab18972b50a46fd4e4cd7b899e510a15.jpg"
        ]
        for item in arr{
            let model = ZEModel()
            model.imageUrl = item
            dataArr.append(model)
        }
        for item in arr{
            let model = ZEModel()
            model.imageUrl = item
            dataArr.append(model)
        }
    }

}
