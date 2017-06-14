//
//  FriendViewController.swift
//  WereWolf
//
//  Created by 刘毅 on 2017/6/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class FriendSceneController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Friends"
        self.view.backgroundColor = UIColor.white

        let leftButtonImage = UIImage.ionicon(with: .addPerson, textColor: UIColor.darkGray, size: CGSize(width: 21, height: 21))
        
        let btn = UIButton()
        btn.setImage(leftButtonImage, for: UIControlState.normal)
        // btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        // btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        self.addFriendSubView()
        
    }
    
    func addFriendSubView() {
        
        // 插入好友界面
        let friendScrollView = UIScrollView()
        // 大小
        friendScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        // add subview
        self.view.addSubview(friendScrollView)
        
        // 设定每个 cell
        let collectionLayout = UICollectionViewFlowLayout()
        // 滚动方向
        collectionLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        collectionLayout.itemSize = CGSize(width:screenWidth, height: 50)
        //上下间隔
        collectionLayout.minimumLineSpacing = 0
        //左右间隔
        collectionLayout.minimumInteritemSpacing = 0
        
        // 初始化
        let friendListView = FriendListView.init(frame:friendScrollView.layer.bounds, layout:collectionLayout)
        // 添加到界面
        friendScrollView.addSubview(friendListView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
