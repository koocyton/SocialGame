//
//  MineViewController.swift
//  WereWolf
//
//  Created by 刘毅 on 2017/6/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class MineSceneController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Mine"
        self.view.backgroundColor = UIColor.white;
        
        let profile = UIView()
        profile.frame = CGRect(x: -1, y: 63, width: screenWidth + 2, height: screenWidth * 0.618)
        profile.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.8).cgColor
        profile.layer.borderWidth = 1
        
        let face = UIImageView(image:UIImage(named: "resource/image/timg"))
        face.frame = CGRect(x:10, y:30, width:100, height:100)
        profile.addSubview(face)
        
        let name = UITextView()
        name.text = "昵称 : koocyton"
        name.frame = CGRect(x:10, y:140, width:100, height:100)
        profile.addSubview(name)
        
        self.view.addSubview(profile)
        
        let setLable = UIButton()
        let setCover = UIImage.ionicon(with: .setup, textColor: UIColor.darkGray, size: CGSize(width: 40, height: 40))
        setLable.frame = CGRect(x: -1, y: 318, width: screenWidth+2, height: 40)
        setLable.setImage(setCover, for: .normal)
        setLable.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, screenWidth - 50);
        setLable.layer.borderWidth = 1
        setLable.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.8).cgColor
        setLable.setTitle("设置", for: .normal)
        setLable.titleEdgeInsets = UIEdgeInsetsMake(10, 30, 10, screenWidth - 250);
        setLable.setTitleColor(UIColor.black, for: .normal)
        setLable.setTitleColor(UIColor.darkGray, for: .highlighted)
        self.view.addSubview(setLable)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
