//
//  ViewController.swift
//  WereWolf
//
//  Created by 刘毅 on 2017/6/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class GameHelperController: UIViewController {
    
    
    
    // let deceitGameView : DeceitGameView
    
    override func viewDidLoad() {
        
        // self.view.deceitGameView = DeceitGameView()
        
        super.viewDidLoad()
        
        // self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        // Do any additional setup after loading the view, typically from a nib.
        
        // self.view.alpha = 1
        
        self.navigationItem.title = "游戏帮助"
        self.view.backgroundColor = UIColor.white
        
        let goBackImage = UIImage.ionicon(with: .go_back, textColor: UIColor.white, size: CGSize(width: 30, height: 30))
        let goBackBtn = UIButton()
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: goBackBtn)
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

