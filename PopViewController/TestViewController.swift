//
//  TestViewController.swift
//  PopViewController
//
//  Created by Mac on 16/5/4.
//  Copyright © 2016年 夏天. All rights reserved.
//
/************************************************************** */
/**** 文章你可以看我的简书   http://www.jianshu.com/p/01a420681ca9  */
/**** 我的个人站           littlesummerboy.com                    */
/************************************************************** */
import UIKit

class TestViewController: XtPopViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let popView1 = UIView.init(frame: CGRectMake(0, screen_Height, screen_Width, screen_Height / 2))
        /// popView1 是点击打开的时候下方弹出的view
        popView1.backgroundColor = UIColor.grayColor()
        /// 加个阴影
        popView1.layer.shadowColor = UIColor.blackColor().CGColor
        popView1.layer.shadowOffset = CGSizeMake(0.5, 0.5)
        popView1.layer.shadowOpacity = 0.8
        popView1.layer.shadowRadius = 5

        let main = ViewController()
        let mainNav = UINavigationController.init(rootViewController: main)
        
        /// 关闭按钮
        let btnClose = UIButton.init(type: UIButtonType.Custom)
        btnClose.frame = CGRectMake(15, 0, 50, 40)
        btnClose.setTitle("Close", forState: UIControlState.Normal)
        btnClose.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        btnClose.addTarget(self, action:#selector(TestViewController.close), forControlEvents: UIControlEvents.TouchUpInside)
        popView1.addSubview(btnClose)

        // 打开按钮
        let btnOpen = UIButton.init(type: UIButtonType.Custom)
        btnOpen.frame = CGRectMake(((screen_Width - 100) / 2), 300, 50, 40)
        
        btnOpen.setTitle("打开", forState: UIControlState.Normal)
        btnOpen.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        btnOpen.addTarget(self, action: #selector(TestViewController.open), forControlEvents: UIControlEvents.TouchUpInside)
        /// main.view 是主控制器的self.view
        main.view.addSubview(btnOpen)
        main.view.backgroundColor = UIColor.whiteColor()
        main.title = "XTtest"
        self.createPopViewControllerWithMainViewController(mainNav, popView: popView1)
//        self.view.backgroundColor = UIColor.whiteColor() // 底部
    }
    func open()
    {
        print("+++++++++")
        self.openAction()
    }
    func close()
    {
        self.closeAction()
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
