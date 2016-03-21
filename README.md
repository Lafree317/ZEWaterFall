
![CHT瀑布流.gif](http://upload-images.jianshu.io/upload_images/1298596-8059b1112a7d6403.gif?imageMogr2/auto-orient/strip)


面向iOS新手写的...内容较水..见谅

这个demo主要是利用CHTcollectionViewWaterfall这个强大的第三方而搭建的可展开收起的瀑布流效果

我也是为了熟悉一下swift语言的collectionView的一些方法的调用.
demo里最重要的几行代码:

```
// 上下左右间距
layout.sectionInset = UIEdgeInsetsMake(5, 5,5, 5)
// 横向行数
layout.columnCount = 2
// item左右间距
layout.minimumColumnSpacing = 5;
// item 上下间距
layout.minimumInteritemSpacing = 5;
```
需要cocoaPos导入SDWebImage和CHTcollectionViewWaterfall

