//
//  DeceitGameView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class DeceitGameView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Deceit Game"
        
        // override var preferredStatusBarStyle: UIStatusBarStyle
        // UIApplication.shared.statusBarStyle = .lightContent
        
        // self.tabBarController?.tabBar.isHidden = true;
        // self.findController().hidesBottomBarWhenPushed = false

        self.view.frame = CGRect(x: 0, y: 40, width: screenWidth, height: 20)
        self.view.layer.cornerRadius = 10.0
        
        // self.findNavigator().sta preferredStatusBarStyle = .default
        
        /*
        let maskPath = UIBezierPath(roundedRect: self.view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii:CGSize(width:10, height:10))
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.view.frame
        rectShape.position = self.view.center
        rectShape.path = maskPath as! CGPath
        */
        
        // self.view.layer.backgroundColor = UIColor.green as? CGColor
        //Here I'm masking the textView's layer with rectShape layer
        
        
        let goBackImage = UIImage.ionicon(with: .go_back, textColor: UIColor.darkGray, size: CGSize(width: 21, height: 21))
        let goBackBtn = UIButton()
        goBackBtn.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.view.addSubview(goBackBtn)
        // self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: goBackBtn)

        self.view.backgroundColor = UIColor.black;
    }

    func findController() -> UIViewController! {
        return self.findControllerWithClass(UIViewController.self)
    }
    
    func findNavigator() -> UINavigationController! {
        return self.findControllerWithClass(UINavigationController.self)
    }
    
    func findControllerWithClass<T>(_ clzz: AnyClass) -> T? {
        var responder = self.next
        while(responder != nil) {
            if (responder!.isKind(of: clzz)) {
                return responder as? T
            }
            responder = responder?.next
        }
        return nil
    }
    
    func goBack() {
        self.dismiss(animated: true, completion: nil)
        /*
        let alertController = UIAlertController(title: "System message",
                                                message: "Do you want to quit the game?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Yes", style: .default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
            // self.navigationController?.popViewController(animated: true)
            // self.tabBarController?.tabBar.isHidden = false;
        })
        alertController.addAction(noAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
