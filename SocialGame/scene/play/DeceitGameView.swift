//
//  DeceitGameView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class DeceitGameView: UIViewController {
    
    let gameScreen = UIView();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Deceit Game"
        
        // override var preferredStatusBarStyle: UIStatusBarStyle
        // UIApplication.shared.statusBarStyle = UIStatusBarStyle.default

        self.addGameScreen()
        // self.view.backgroundColor = UIColor.black;
    }
    
    func addGameScreen() {
        // let gameScreen = UIView();
        self.gameScreen.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)
        self.gameScreen.layer.cornerRadius = 10.0
        self.gameScreen.backgroundColor = UIColor.white

        let goBackImage = UIImage.ionicon(with: .drag, textColor: UIColor.darkGray, size: CGSize(width: 60, height: 20))
        let goBackBtn = UIButton()
        goBackBtn.frame = CGRect(x: screenWidth/2-30, y: 0, width: 30, height: 20)
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.gameScreen.addSubview(goBackBtn)
        
        self.view.addSubview(self.gameScreen)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
        // return UIStatusBarStyle.Default
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
