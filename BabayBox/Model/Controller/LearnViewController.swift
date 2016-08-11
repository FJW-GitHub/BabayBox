//
//  LearnViewController.swift
//  BabayBox
//
//  Created by xiaofu on 16/4/5.
//  Copyright © 2016年 xiaofu. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController, ImageLabelViewDelegate {
    let titleList = ["","",""]
  lazy var imageList = ["颜色","形状","数字","字母","动物"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        for i in 0 ..< imageList.count {
            let image = UIImage.init(named: imageList[i])
            let imageLabel = ImageLabelView.init(frame: CGRectMake(100, 100, image!.size.width, image!.size.height), image: image!, title: imageList[i])
            imageLabel.delegate = self
            imageLabel.tag = 100 + i
            self.view.addSubview(imageLabel)
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for  i in 0 ..< imageList.count{
            let image = UIImage.init(named:imageList[i])
            let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
            let num: UInt32 = UInt32(SCREEN_WIDTH-image!.size.width)
            let rand = arc4random()%num+50;
            let imageLabel = self.view.viewWithTag(100 + i) as! ImageLabelView
            imageLabel.frame = CGRectMake(CGFloat(rand), 50.0+(image!.size.height+10.0)*CGFloat(i), image!.size.width, image!.size.height);
            let pan = UIPanGestureRecognizer.init(target: self, action: #selector(LearnViewController.move(_:)))
            imageLabel.addGestureRecognizer(pan)
        }
    }
    func  move(sender: UIPanGestureRecognizer)  {
        
        sender.view!.center = sender.locationInView(self.view)
    }
    func didSelectView(sender: ImageLabelView) {
        sender.jump()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
