# ClickaAnomalyView
1,点击不规则view , 响应不同区域 ; 2 ,实现view透明区域点击事件穿透

思路介绍 : 
    简单介绍下，iOS中的pointInside:withEvent:方法是用来判断当前的点击或者触摸事件的点是否在当前的
view中，它被hitTest:withEvent:调用，通过对每个子视图调用pointInside:withEvent:决定最终哪个视图
来响应此事件。如果一个子视图的pointInside:withEvent:返回NO，说明这个子视图不会响应点击事件，然后就去
寻找更深层的子视图来找到最终响应触摸事件；返回YES就说明子视图能响应点击事件（但不一定是子视图本身响应，若
子视图还有子视图的话，还会继续循环去找最终响应事件的子子视图）。
    于是，本文的问题就可以这样转化：创建一个UIButton的子类，重写pointInside:withEvent:方法，让矩
形图片的透明区域的pointInside:withEvent:返回NO，而非透明区域的pointInside:withEvent:返回YES，
如果能达到这个要求，透明区域点击事件穿透就能够实现。

现在的关键问题是怎么识别出这个透明区域? 
    iOS中通常用的图片是PNG图片，这种图片有alpha通道，如果能获取PNG图片每个像素的alpha值，就不难判断
出手指点击的图片区域是不是透明的。


Tip: 当然,如果使用UIImageView也可以实现,只需要创建一个继承UIImageView的子类,重写  pointInside:withEvent:即可  
