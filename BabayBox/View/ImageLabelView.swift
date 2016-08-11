//
//  ImageLabelView.swift
//  BabayBox
//
//  Created by xiaofu on 16/4/6.
//  Copyright © 2016年 xiaofu. All rights reserved.
//
/*
 对象的特征
 oc
 @property 修饰属性
 swift
 没有全局变量 都是属性
 如果想在本类使用用private修饰
 1.类型属性 使用类名 调用 这个类名是指写在那个类里，就用那个类 写在方法外面
 class var 声明的变量 类似全局变量 但是不可赋值只能获得return里面的值
 可以当作静态参数 与static修饰符类似
 class var name: UIImageView {return UIImageView()}
 class var 类型名: 父类 {return 父类的一个值或者对象}
 2.观察属性 观察给属性赋值的状态 写在一个方法里
 属性中 可设置 willSet将要设置 didSet已经设置 来观察 属性的设置
 需要对age声明为可选类型
 var 变量名: 变量类型?{
 willSet {
 在这里可以知道值改变之前的值
 }
 didSet{
 在这里知道改变之后的值
 }
 }
 列子
 var age: Int?{
 willSet {
 print("将要赋值")
 }
 didSet{
 print("已经赋值")
 }
 }
 age = 10
 oc 属性是通过定义一个全局变量 _变量名 让传过来的参数 给它赋值
 
 3.实例属性
 在类中声明的 var 变量名:数据类型? 使用对像去调用
 
 懒加载 懒惰属性  lazy 会在使用的时候创建 必须创建，并有值，值为空或为确定值
 lazy var list = [""] 相当于一个方法
 计算属性 在属性中改变属性对应的值 在set或者get方法中改变的  重写set get 相当于一个方法
 var sum: Int {
 get{
 return 1 + self.sum
 }
 set{
 self.sum += self.sum
 }
 }
 override 重新父类的方法
 extension来声明类目 类名{}
 */

import UIKit
//声明代理的方法
protocol ImageLabelViewDelegate: NSObjectProtocol {
    
    func didSelectView(sender: ImageLabelView)
}
class ImageLabelView: UIImageView {
    var delegate: ImageLabelViewDelegate?
    
     var titleLabel: UILabel?//声明属性
    class var name: UIImageView {return UIImageView()}
       lazy var list = [""]
     init(frame: CGRect, image: UIImage, title: NSString){
        super.init(frame: frame)
        self.image = image
        self.contentMode = .ScaleAspectFit
        titleLabel = UILabel.init(frame: self.bounds)
        self.addSubview(titleLabel!)
        titleLabel!.text = title as String
        titleLabel!.textColor = UIColor.whiteColor()
        titleLabel!.font = UIFont.boldSystemFontOfSize(25)
        titleLabel!.shadowColor = UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        titleLabel!.textAlignment = .Center
        titleLabel!.adjustsFontSizeToFitWidth = true
        self.userInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action:#selector(ImageLabelView.action(_:)) )
        self.addGestureRecognizer(tap)
        
    }
    func action(sender: UITapGestureRecognizer){
        delegate!.didSelectView(sender.view as! ImageLabelView)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func jump() -> Void {
        
    }

}




























