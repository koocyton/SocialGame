//
//  FriendListView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class FriendsScene: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let friendDetailScreen : FriendDetailScreen = FriendDetailScreen()
    
    init(frame: CGRect, layout: UICollectionViewLayout) {
        
        // self.friendDetailScreen = FriendDetailScreen()
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        // self.init(frame: self.layer.bounds, collectionViewLayout: layout)
        // self.frame = CGRect(x: 0, y: 0, width: centerViewWidth, height: centerViewHeight)
        
        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
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
        self.friendDetailScreen.name = cell.name.text!
        self.findNavigator()?.pushViewController(self.friendDetailScreen, animated: true)
        // self.findController().hidesBottomBarWhenPushed = false
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // default cover
        let ii : Int = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
        if (ii<=5) {
            cell.addInvite()
            cell.name.textColor = UIColor.black
        }
        else {
            cell.name.textColor = UIColor.gray
        }
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
    
    let name = UILabel()
    
    let invite = UIButton()
    
    var inline = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageHeight = 50
        
        // 封面图
        cover = UIImageView.init(frame: self.layer.bounds)
        cover.frame = CGRect(x: 5, y: 5, width: imageHeight, height: imageHeight)
        cover.image = UIImage(named:"resource/image/fanghan")
        // cover.image = UIImage.ionicon(with: .person, textColor: UIColor.black, size: CGSize(width: imageHeight, height: imageHeight))
        self.addSubview(cover)
        
        // 好友名字
        name.frame = CGRect(x: 70, y: 20, width: 100, height: 20)
        name.text = "方汉"
        name.textAlignment = NSTextAlignment.left
        name.textColor = UIColor.black
        self.addSubview(name)
        
        // 插入下划线
        let hrView = UIView(frame: (self.layer.bounds))
        hrView.frame = CGRect(x: 0, y: self.layer.bounds.size.height, width: screenWidth, height: 1)
        hrView.layer.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.5).cgColor
        self.addSubview(hrView)
    }
    
    func addInvite()
    {
        invite.frame = CGRect(x: screenWidth - 100, y: 15, width: 80, height: 30)
        invite.setTitle("一起玩", for: .normal)
        invite.setTitleColor(UIColor.black, for: .normal)
        invite.tintColor = UIColor.black
        invite.layer.cornerRadius = 4
        invite.layer.borderWidth = 1
        invite.layer.borderColor = UIColor.black.cgColor
        self.addSubview(invite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
