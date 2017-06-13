//
//  ViewController.swift
//  WereWolf
//
//  Created by 刘毅 on 2017/6/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

let channelContentHeight : CGFloat = 100

let cellHeight : CGFloat = 100

class PlayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Games"
        self.view.backgroundColor = UIColor.white
        
        self.addPlaySubView()
    }
    
    func addPlaySubView() {

        // 插入游戏界面
        let playScrollView = UIScrollView()
        // 大小
        playScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        // 滑动区的内容区的大小
        playScrollView.contentSize = CGSize(width: centerViewWidth , height:centerViewHeight * 2)
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
        
        // 滚屏内插入游戏内容
        let collectionViewLayout = UICollectionViewFlowLayout()
        // 滚动方向
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        collectionViewLayout.itemSize = CGSize(width:screenWidth, height: 100 )
        //上下间隔
        collectionViewLayout.minimumLineSpacing = 0
        //左右间隔
        collectionViewLayout.minimumInteritemSpacing = 0
        // 初始化
        let gamesView = GamesView.init(frame: playScrollView.layer.bounds, layout: collectionViewLayout)

        // 大小, 坐标
        //gamesView.frame = CGRect(x: CGFloat(ii) * screenWidth, y: 0, width: screenWidth, height: channelContentHeight)
        //gamesView.contentSize = CGSize(width: screenWidth , height:channelContentHeight-200)
        // oneChannelView.scrollRectToVisible(<#T##rect: CGRect##CGRect#>, animated: <#T##Bool#>)
        //oneChannelView.delegate = oneChannelView
        //oneChannelView.dataSource = oneChannelView
        // oneChannelView.cellData = channel
        // gamesView.tag = 100 + ii
        // 添加到界面
        playScrollView.addSubview(gamesView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

