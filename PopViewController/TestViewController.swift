//
//  TestViewController.swift
//  PopViewController
//
//  Created by summerxx on 16/5/4.
//  Copyright © 2016年 summerxx. All rights reserved.
//
/************************************************************** */
/**** 文章你可以看我的简书   http://www.jianshu.com/p/01a420681ca9  */
/************************************************************** */
import UIKit

class TestViewController: XTPopViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let popView1 = UIView.init(frame: CGRect.init(x: 0, y: screen_Height, width: screen_Width, height: 450))
        /// popView1 是点击打开的时候下方弹出的view
        popView1.backgroundColor = UIColor.red
        /// 加个阴影
        popView1.layer.shadowColor = UIColor.black.cgColor
        popView1.layer.shadowOffset = CGSize.init(width: 0.5, height: 0.5)
        popView1.layer.shadowOpacity = 0.8
        popView1.layer.shadowRadius = 5

        let main = ViewController()
        let mainNav = UINavigationController.init(rootViewController: main)
        
        /// 关闭按钮
        let btnClose = UIButton.init(type: UIButton.ButtonType.custom)
        btnClose.frame = CGRect.init(x: 15, y: 0, width: 50, height: 40)
        btnClose.setTitle("Close", for: UIControl.State.normal)
        btnClose.setTitleColor(UIColor.cyan, for: UIControl.State.normal)
        btnClose.addTarget(self, action:#selector(close), for: UIControl.Event.touchUpInside)
        popView1.addSubview(btnClose)

        // 打开按钮
        let btnOpen = UIButton.init(type: UIButton.ButtonType.custom)
        btnOpen.frame = CGRect.init(x: 0, y: 0, width: 50, height: 40)
        btnOpen.center = self.view.center;
        btnOpen.setTitle("open", for: UIControl.State.normal)
        btnOpen.setTitleColor(UIColor.cyan, for: UIControl.State.normal)
        btnOpen.addTarget(self, action: #selector(open), for: UIControl.Event.touchUpInside)
        /// main.view 是主控制器的self.view
        main.view.addSubview(btnOpen)
        main.view.backgroundColor = UIColor.white
        main.title = "summerxx"
        self.createPopViewControllerWithMainViewController(root: mainNav, popView: popView1)
        
        
    }
    
    @objc func open()
    {
        print("+++++++++")
        self.openAction()
    }
    
    @objc func close()
    {
        self.closeAction()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
