//
//  XtPopViewController.swift
//  PopViewController
//
//  Created by summerxx on 5/4/16.
//  Copyright © 2016 summerxx. All rights reserved.
//

import UIKit
let screen_Width = UIScreen.main.bounds.size.width
let screen_Height = UIScreen.main.bounds.size.height
class XTPopViewController: UIViewController {

        /// 在底部弹出的View
    var popView = UIView()
        /// rootView
    var rootView = UIView()
        /// 主VC
    var mainVc: UIViewController?
        /// maskView
    var maskView = UIView()
    func createPopViewControllerWithMainViewController(root: UIViewController, popView: UIView) -> Void {
        
        self.mainVc = root
        self.popView = popView
        self.createSubviews()
    }
    
    func createSubviews() {
        self.view.backgroundColor = UIColor.black
        mainVc!.view.frame = self.view.bounds
        rootView = mainVc!.view
        self.addChild(mainVc!)
        self.view.addSubview(rootView)
        
    }
    
    func closeAction(){
        var frame = popView.frame
        frame.origin.y += popView.frame.size.height
        
        UIView.animate(withDuration: 0.3, animations: {
            self.popView.frame = frame
            // 改善滑动效果
            self.rootView.layer.transform = self.firstTransform()
            
            }) { (Bool) in
                UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    // 变为初始值
                    self.rootView.layer.transform = CATransform3DIdentity;
                    }, completion: { (Bool) in
                        // 移除
                        self.popView.removeFromSuperview()
                })
        }
        
        
        
    }
    
    func openAction(){
        UIApplication.shared.windows[0].addSubview(popView)
        var frame = popView.frame
        frame.origin.y = self.view.bounds.size.height - self.popView.frame.size.height
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            
            self.rootView.layer.transform = self.firstTransform()
            }) { (Bool) in
                
                UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    
                    self.rootView.layer.transform = self.secondTransform()
                    // popView上升
                    self.popView.frame = frame
                    }, completion: { (Bool) in
                })
        }
        
    }
    
    func firstTransform() -> CATransform3D {
        var t1 = CATransform3DIdentity;
        t1.m34 = 1.0 / -900;
        //带点缩小的效果
        t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
        //绕x轴旋转
        t1 = CATransform3DRotate(t1, 15.0 * (CGFloat)(M_PI)/180.0, 1, 0, 0);
        return t1;
    }
    
    func secondTransform() -> CATransform3D {
        var t2 = CATransform3DIdentity
        t2.m34 = self.firstTransform().m34;
        //向上移
        t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.08), 0);
        //第二次缩小
        t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
        return t2;
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
