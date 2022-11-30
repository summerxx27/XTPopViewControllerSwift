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
        
        /// popView 是点击打开的时候下方弹出的view
        let popView = UIView().then {
            $0.frame = CGRect(x: 0, y: screen_Height, width: screen_Width, height: 450)
            $0.backgroundColor = .red
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            $0.layer.shadowOpacity = 0.8
            $0.layer.shadowRadius = 5
        }


        let main = ViewController()
        let mainNav = UINavigationController.init(rootViewController: main)
        
        /// 关闭按钮
        let btnClose = UIButton().then {
            $0.frame = CGRect(x: 15, y: 0, width: 50, height: 40)
            $0.setTitle("Close", for: .normal)
            $0.setTitleColor(.cyan, for: .normal)
            $0.addTarget(self, action:#selector(close), for: .touchUpInside)
        }

        popView.addSubview(btnClose)

        let btnOpen = UIButton().then {
            $0.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
            $0.center = self.view.center;
            $0.setTitle("open", for: .normal)
            $0.setTitleColor(UIColor.cyan, for: .normal)
            $0.addTarget(self, action: #selector(openClick), for: .touchUpInside)
        }

        main.view.addSubview(btnOpen)
        main.view.backgroundColor = .white
        main.title = "summerxx"
        createPopViewController(rootVC: mainNav, bottomView: popView)
    }
    
    @objc func openClick() {
        self.openAction()
    }
    
    @objc func close() {
        self.closeAction()
    }
}
