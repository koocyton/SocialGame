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
        
        let goBackImage = UIImage.ionicon(with: .go_back, textColor: UIColor.darkGray, size: CGSize(width: 21, height: 21))
        let goBackBtn = UIButton()
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: goBackBtn)
        
        self.view.backgroundColor = UIColor.white;
    }

    func goBack() {
        
        let alertController = UIAlertController(title: "System message",
                                                message: "Do you want to quit the game?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Yes", style: .default, handler: {_ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.tabBar.isHidden = false;
        })
        alertController.addAction(noAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
