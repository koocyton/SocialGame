//
//  ViewController.swift
//  WereWolf
//
//  Created by 刘毅 on 2017/6/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

// 屏幕宽
let screenWidth : CGFloat = UIScreen.main.bounds.size.width

// 屏幕高
let screenHeight : CGFloat = UIScreen.main.bounds.size.height

// 顶部 Status Bar 的高度
let statusBarHeight : CGFloat = CGFloat(20)

// 顶部 Navigation 高度
let navigationHeight : CGFloat = CGFloat(44)

// 底部导航的高度
let tabBarHeight : CGFloat =  CGFloat(49)

// scroll view full height
let scrollHeight : CGFloat = screenHeight - statusBarHeight - navigationHeight - tabBarHeight;

// scroll view full height
let scrollX : CGFloat = statusBarHeight + navigationHeight;


class PlayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Games"
        self.view.backgroundColor = UIColor.white

        let gamesScrollView = UIScrollView();
        gamesScrollView.frame = CGRect(x:scrollX, y:0, width:screenWidth, height:scrollHeight)
        self.view.addSubview(gamesScrollView)
        self.addGames()
    }

    /*
     * 添加游戏
     */
    func addGames() {
        let imageView = UIImageView(image:UIImage(named:"resource/image/chrome.png"))
        imageView.frame = CGRect(x:10, y:30, width:300, height:150)
        self.view.addSubview(imageView)
    
        // self.navigationController?.pushViewController(FriendViewController(), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

