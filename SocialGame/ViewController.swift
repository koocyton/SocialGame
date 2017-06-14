//
//  ViewController.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/13.
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
let centerViewWidth  : CGFloat = screenWidth;
let centerViewHeight : CGFloat = screenHeight - statusBarHeight - navigationHeight - tabBarHeight;

// scroll view full height
let centerViewX : CGFloat = 0;
let centerViewY : CGFloat = statusBarHeight + navigationHeight;

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // UI Play VIEW Controller
        let playScene = UINavigationController(rootViewController: PlaySceneController())
        playScene.tabBarItem.title = "Play";
        self.addChildViewController(playScene)

        // UI Friend VIEW Controller
        let friendScene = UINavigationController(rootViewController: FriendSceneController())
        friendScene.tabBarItem.title = "Friend";
        self.addChildViewController(friendScene)

        // UI Message VIEW Controller
        let messageScene = UINavigationController(rootViewController: MessageSceneController())
        messageScene.tabBarItem.title = "Message";
        self.addChildViewController(messageScene)

        // UI Mine VIEW Controller
        let mineScene = UINavigationController(rootViewController: MineSceneController())
        mineScene.tabBarItem.title = "Mine";
        self.addChildViewController(mineScene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

