//
//  GameCollectionView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/24.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit


class GameCollection: UICollectionViewController {

    init(layout: UICollectionViewLayout) {
        
        // self.deceitGameView = DeceitGameView()
        
        super.init(collectionViewLayout: layout)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // 点击 cell 的时候
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        // deceitGameView.slideInto()
    }
    
    // 每个 cell 的处理
    // func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    //    let gameCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
    //    return gameCell
        
    //}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


