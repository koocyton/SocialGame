//
//  DeceitGameView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class DeceitGameView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)
        self.layer.cornerRadius = 10.0
        self.backgroundColor = UIColor.white
        self.alpha = 1
        
        self.addGameScreen()
    }
    
    // let gameScreen = UIView();

    /* override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Deceit Game"
        
        //self.alpha = 0.5
        //self.alp
        
        // override var preferredStatusBarStyle: UIStatusBarStyle
        // UIApplication.shared.statusBarStyle = UIStatusBarStyle.default

        self.addGameScreen()
        // self.view.backgroundColor = UIColor.black;
    } */
    
    func addGameScreen() {
        // let gameScreen = UIView();
        // self.gameScreen.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)


        let goBackImage = UIImage.ionicon(with: .drag, textColor: UIColor.darkGray, size: CGSize(width: 60, height: 20))
        let goBackBtn = UIButton()
        goBackBtn.frame = CGRect(x: screenWidth/2-30, y: 0, width: 30, height: 20)
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        // goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.addSubview(goBackBtn)
        
        // let person1 = UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 60, height: 60))
        
        for ii in 0...5 {
            let y = 40 + ii * 80
            let person1 = UIButton()
            person1.frame = CGRect(x: 10, y: y, width: 70, height: 70)
            person1.setImage(
            UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 70, height: 70)),
            for: .normal)
            person1.layer.cornerRadius = 4
            person1.layer.borderWidth = 1
            person1.layer.borderColor = UIColor.gray.cgColor
            self.addSubview(person1)
        }
        
        for ii in 0...5 {
            let y = 40 + ii * 80
            let x = screenWidth - 80
            let person1 = UIButton()
            person1.frame = CGRect(x: Int(x), y: y, width: 70, height: 70)
            person1.setImage(
                UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 70, height: 70)),
                for: .normal)
            person1.layer.cornerRadius = 4
            person1.layer.borderWidth = 1
            person1.layer.borderColor = UIColor.gray.cgColor
            self.addSubview(person1)
        }
        
        // self.view.addSubview(self.gameScreen)
    }
    

    /* 
 override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
        // return UIStatusBarStyle.Default
    }
*/
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

    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let center = self.center
        if (center.y>screenHeight/2+screenHeight/4) {
            self.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
            // self.findNavigator().navigationController?.navigationBar.barStyle = .default
            //self.findNavigator().isNavigationBarHidden = false
            //self.findNavigator().tabBarController?.tabBar.isHidden = false
            //self.findNavigator().setNavigationBarHidden(false, animated: true)
            UIApplication.shared.statusBarStyle = .lightContent
        }
        else {
            self.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)
            // self.findNavigator().navigationController?.navigationBar.barStyle = .black
            //self.findNavigator().isNavigationBarHidden = true
            //self.findNavigator().navigationController?.view.backgroundColor = UIColor.red
            //self.findNavigator().tabBarController?.tabBar.isHidden = true
            // self.findNavigator().navigationController?.view.accessibilityNavigationStyle = .lightContent
            //self.findNavigator().setNavigationBarHidden(true, animated: true)
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //获取手指
        let touch = (touches as NSSet).anyObject() as! UITouch
        let nowLocation = touch.location(in: self)
        let preLocation = touch.previousLocation(in: self)
        
        //获取两个手指的偏移量
        // let offsetX = nowLocation.x - preLocation.x
        let offsetY = nowLocation.y - preLocation.y
        
        var center = self.center
        if (center.y+offsetY-screenHeight/2+20<20) {
            return;
        }
        // center.x += offsetX
        center.y = center.y + offsetY
        
        /* if (center.y>screenHeight/2+screenHeight/4) {
            self.findController().dismiss(animated: true, completion: nil)
        } */

        self.center = center
    }
    
    //func goBack() {
    //    self.dismiss(animated: true, completion: nil)
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
    //}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
