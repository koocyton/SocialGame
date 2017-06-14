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
        // self.tabBarController?.tabBar.isHidden = true;
        // self.findController().hidesBottomBarWhenPushed = false
        self.view.backgroundColor = UIColor.white;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
