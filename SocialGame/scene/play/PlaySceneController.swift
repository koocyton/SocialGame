//
//  ViewController.swift
//  WereWolf
//
//  Created by 刘毅 on 2017/6/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

let cellHeight : CGFloat = 200

class PlaySceneController: UIViewController {
    
    
    
    // let deceitGameView : DeceitGameView
    
    override func viewDidLoad() {
        
        // self.view.deceitGameView = DeceitGameView()
        
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        // Do any additional setup after loading the view, typically from a nib.

        // self.view.alpha = 1

        self.navigationItem.title = "游戏列表"
        self.view.backgroundColor = UIColor.white
        // self.tabBarController?.tabBar.isHidden = false;
        
        self.addPlaySubView()
    }
    
    /* override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    } */
    
    func addPlaySubView() {

        // 插入游戏界面
        //let playScrollView = UIScrollView()
        // 大小
        //playScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        // playScrollView.contentInset = UIEdgeInsetsMake(0 - centerViewY, 0.0, 80.0, 0.0)
        //playScrollView.contentSize = CGSize(width: screenWidth, height: 3 * (screenHeight - 150))
        
        // playScrollView.layer.scroll(CGPoint(x: 60, y:60))
        // playScrollView.contentSize = CGPoint(x:0, y:-60)
        // 滑动区的内容区的大小
        // playScrollView.contentSize = CGSize(width: screenWidth, height: screenHeight)
        // playScrollView.setContentOffset(CGPoint(x: 0, y: -60), animated: false)
        // 背景色
        // self.backgroundColor = UIColor.darkGray
        // 是否按页滚动
        //playScrollView.isPagingEnabled = true
        // 水平滚动，而不显示滚动条
        // self.alwaysBounceHorizontal = true
        // 上下滚动
        //playScrollView.showsHorizontalScrollIndicator = true
        //playScrollView.showsVerticalScrollIndicator = false
        // self.view.addSubview(playScrollView)
        
        // 设定每个 cell
        let collectionLayout = UICollectionViewFlowLayout()
        // 滚动方向
        collectionLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        collectionLayout.itemSize = CGSize(width:screenWidth, height: screenHeight - 150) //cellHeight
        //上下间隔
        collectionLayout.minimumLineSpacing = 0
        //左右间隔
        collectionLayout.minimumInteritemSpacing = 0

        // 初始化
        let gameListView = GameListView.init(frame: self.view.layer.bounds, layout: collectionLayout)
        // 添加到界面
        self.view.addSubview(gameListView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

