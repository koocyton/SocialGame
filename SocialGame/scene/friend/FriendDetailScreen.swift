//
//  DeceitGameView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class FriendDetailScreen: UIViewController {
    
    var name : String = ""

    var key  : Int   = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = name
        // self.tabBarController?.tabBar.isHidden = true;
        // self.findController().hidesBottomBarWhenPushed = false
        
        let goBackImage = UIImage.ionicon(with: .go_back, textColor: UIColor.darkGray, size: CGSize(width: 30, height: 30))
        let goBackBtn = UIButton()
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: goBackBtn)

        self.view.backgroundColor = UIColor.white;
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
