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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Games"
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = false;
        
        self.addPlaySubView()
    }
    
    func addPlaySubView() {

        // 插入游戏界面
        let playScrollView = UIScrollView()
        // 大小
        playScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        // 滑动区的内容区的大小
        // playScrollView.contentSize = CGSize(width: centerViewWidth , height:centerViewHeight * 2)
        // 背景色
        // self.backgroundColor = UIColor.darkGray
        // 是否按页滚动
        // self.isPagingEnabled = true
        // 水平滚动，而不显示滚动条
        // self.alwaysBounceHorizontal = true
        // 上下滚动
        // self.showsHorizontalScrollIndicator = true
        // self.showsVerticalScrollIndicator = false
        self.view.addSubview(playScrollView)
        
        // 设定每个 cell
        let collectionViewLayout = UICollectionViewFlowLayout()
        // 滚动方向
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        collectionViewLayout.itemSize = CGSize(width:screenWidth, height: cellHeight)
        //上下间隔
        collectionViewLayout.minimumLineSpacing = 0
        //左右间隔
        collectionViewLayout.minimumInteritemSpacing = 0

        // 初始化
        let gameListView = GameListView.init(frame: playScrollView.layer.bounds, layout: collectionViewLayout)
        // 添加到界面
        playScrollView.addSubview(gameListView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

