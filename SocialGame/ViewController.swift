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


let deceitGameView : DeceitGameView = DeceitGameView()

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tabBar.tintColor = UIColor.darkGray
        // self.tabBar.backgroundColor = UIColor.black
        // self.tabBar.backgroundColor = UIColor.darkGray

        // 毛玻璃效果
        //let blurEffect = UIBlurEffect(style: .regular)
        //let blurView = UIVisualEffectView(effect: blurEffect)
        //blurView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: audioPlayHeight)
        
        // UI Play VIEW Controller
        let playScene = UINavigationController(rootViewController: PlaySceneController())
        // playScene.navigationBar.isHidden = true
        playScene.navigationBar.barStyle = .blackOpaque
        playScene.navigationBar.isTranslucent = true
        playScene.navigationBar.alpha = 0.8
        playScene.tabBarItem.title = "Play";
        playScene.tabBarItem.image = UIImage.ionicon(with: .play, textColor: UIColor.darkGray, size: CGSize(width: 28, height: 28))
        playScene.tabBarItem.selectedImage = UIImage.ionicon(with: .selected_play, textColor: UIColor.darkGray, size: CGSize(width: 28, height: 28))
        self.addChildViewController(playScene)

        // UI Friend VIEW Controller
        let friendsScene = UINavigationController(rootViewController: FriendsSceneController())
        friendsScene.navigationBar.barStyle = .blackTranslucent
        friendsScene.tabBarItem.title = "Friends";
        friendsScene.tabBarItem.image = UIImage.ionicon(with: .friend, textColor: UIColor.darkGray, size: CGSize(width: 28, height: 28))
        friendsScene.tabBarItem.selectedImage = UIImage.ionicon(with: .selected_friend, textColor: UIColor.darkGray, size: CGSize(width: 28, height: 28))
        self.addChildViewController(friendsScene)

        // UI Message VIEW Controller
        let messageScene = UINavigationController(rootViewController: MessageSceneController())
        messageScene.navigationBar.barStyle = .black
        messageScene.tabBarItem.title = "Message";
        messageScene.tabBarItem.image = UIImage.ionicon(with: .message, textColor: UIColor.darkGray, size: CGSize(width: 26, height: 26))
        messageScene.tabBarItem.selectedImage = UIImage.ionicon(with: .selected_message, textColor: UIColor.darkGray, size: CGSize(width: 26, height: 26))
        self.addChildViewController(messageScene)

        // UI Mine VIEW Controller
        let mineScene = UINavigationController(rootViewController: MineSceneController())
        mineScene.navigationBar.barStyle = .default
        mineScene.tabBarItem.title = "Mine";
        mineScene.tabBarItem.image = UIImage.ionicon(with: .mine, textColor: UIColor.darkGray, size: CGSize(width: 26, height: 26))
        mineScene.tabBarItem.selectedImage = UIImage.ionicon(with: .selected_mine, textColor: UIColor.darkGray, size: CGSize(width: 26, height: 26))
        self.addChildViewController(mineScene)
        
        deceitGameView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
        self.view.addSubview(deceitGameView)
        // self.navigationController?.navigationBar.barStyle = .black
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

