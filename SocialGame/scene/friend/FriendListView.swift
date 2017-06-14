//
//  FriendListView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class FriendListView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let friendDetailView : FriendDetailView
    
    init(frame: CGRect, layout: UICollectionViewLayout) {
        
        self.friendDetailView = FriendDetailView()
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        // self.init(frame: self.layer.bounds, collectionViewLayout: layout)
        self.frame = CGRect(x: 0, y: 0, width: centerViewWidth, height: centerViewHeight)
        self.backgroundColor = UIColor.white
        // delegate
        self.delegate = self
        self.dataSource = self
        //注册一个cell
        self.register(FriendCell.self, forCellWithReuseIdentifier:"FriendCell")
    }
    
    func findController() -> UIViewController! {
        return self.findControllerWithClass(UIViewController.self)
    }
    
    func findNavigator() -> UINavigationController! {
        return self.findControllerWithClass(UINavigationController.self)
    }
    
    func findControllerWithClass<T>(_ clzz: AnyClass) -> T? {
        var responder = self.next
        while(responder != nil) {
            if (responder!.isKind(of: clzz)) {
                return responder as? T
            }
            responder = responder?.next
        }
        return nil
    }
    
    
    // 有多少个 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    // 点击 cell 的时候
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let channelAudioView : ChannelAudioView = self.superview?.superview?.viewWithTag(51) as! ChannelAudioView
        //channelAudioView.play()
        // self.findController().hidesBottomBarWhenPushed = true
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
        self.friendDetailView.name = cell.name.text!
        self.findNavigator()?.pushViewController(self.friendDetailView, animated: true)
        // self.findController().hidesBottomBarWhenPushed = false
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // default cover
        // let ii : Int = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
        // cell.frame = CGRect(x: 0, y: indexPath.row * Int(cellHeight), width: Int(screenWidth), height: Int(cellHeight))
        // cell.title.text = "\(channelModel.data[index]["content"][ii]["title"])"
        // cell.intro.text = "\(channelModel.data[index]["content"][ii]["introduction"])"
        // cell.layer.borderColor = UIColor.gray.cgColor
        // cell.layer.borderWidth = 1
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class FriendCell: UICollectionViewCell {
    
    var cover = UIImageView()
    
    var name = UILabel()
    
    var intro = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageHeight = 40
        
        // 封面图
        cover = UIImageView.init(frame: self.layer.bounds)
        cover.frame = CGRect(x: 5, y: 5, width: imageHeight, height: imageHeight)
        cover.image = UIImage.ionicon(with: .person, textColor: UIColor.gray, size: CGSize(width: imageHeight, height: imageHeight))
        self.addSubview(cover)
        
        // 好友名字
        name.frame = CGRect(x: imageHeight, y: 15, width: 100, height: 20)
        name.text = "刘德华"
        name.textAlignment = NSTextAlignment.center
        name.textColor = UIColor.lightGray
        self.addSubview(name)
        
        // 介绍
        //intro.frame = CGRect(x: imageHeight + 30, y: 40, width: screenWidth - imageHeight - 40, height: imageHeight - 30)
        // intro.text = "这里放好听的歌的介绍"
        //intro.textAlignment = NSTextAlignment.left
        //intro.textColor = UIColor.lightGray
        // intro.backgroundColor = UIColor.blue
        //self.addSubview(intro)
        
        // 插入下划线
        let hrView = UIView(frame: (self.layer.bounds))
        hrView.frame = CGRect(x: 0, y: self.layer.bounds.size.height, width: screenWidth, height: 1)
        hrView.layer.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.5).cgColor
        self.addSubview(hrView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
