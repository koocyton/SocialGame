//
//  MessageViewController.swift
//  WereWolf
//
//  Created by 刘毅 on 2017/6/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class MessageSceneController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "视频，直播，图文"
        self.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.view.backgroundColor = UIColor.white;
        
        self.addChannelList()
    }
    
    func addChannelList()
    {
        // 插入好友界面
        let channelScrollView = UIScrollView()
        // 大小
        channelScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        channelScrollView.contentSize = CGSize(width:screenWidth, height:screenWidth * 0.39 * 8 )
        // add subview
        self.view.addSubview(channelScrollView)
        
        channelScrollView.addSubview(self.getBig(x:0, y:0))
        
        channelScrollView.addSubview(self.getLittle(x:0, y:screenWidth * 0.39 ))
        channelScrollView.addSubview(self.getLittle(x:screenWidth/2, y:screenWidth * 0.39 ))
        
        channelScrollView.addSubview(self.getLittle(x:0, y:screenWidth * 0.39 * 2 ))
        channelScrollView.addSubview(self.getLittle(x:screenWidth/2, y:screenWidth * 0.39 * 2 ))
        
        channelScrollView.addSubview(self.getLittle(x:0, y:screenWidth * 0.39 * 3 ))
        channelScrollView.addSubview(self.getLittle(x:screenWidth/2, y:screenWidth * 0.39 * 3 ))
        
        channelScrollView.addSubview(self.getBig(x:0, y:screenWidth * 0.39 * 4 ))
        
        channelScrollView.addSubview(self.getLittle(x:0, y:screenWidth * 0.39 * 5 ))
        channelScrollView.addSubview(self.getLittle(x:screenWidth/2, y:screenWidth * 0.39 * 5 ))
        
        channelScrollView.addSubview(self.getLittle(x:0, y:screenWidth * 0.39 * 6 ))
        channelScrollView.addSubview(self.getLittle(x:screenWidth/2, y:screenWidth * 0.39 * 6 ))
        
        channelScrollView.addSubview(self.getLittle(x:0, y:screenWidth * 0.39 * 7 ))
        channelScrollView.addSubview(self.getLittle(x:screenWidth/2, y:screenWidth * 0.39 * 7 ))
    }
    
    func getBig(x: CGFloat, y: CGFloat) -> UIButton
    {
        let setLable = UIButton()
        let setCover = UIImage(named: "resource/image/timg")// UIImage.ionicon(with: .setup, textColor: UIColor.darkGray, size: CGSize(width: 40, height: 40))
        setLable.frame = CGRect(x: x, y: y, width: screenWidth, height: screenWidth * 0.39)
        setLable.setImage(setCover, for: .normal)
        // setLable.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, screenWidth - 50);
        setLable.layer.borderWidth = 1
        setLable.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.8).cgColor
        setLable.setTitle("设置", for: .normal)
        // setLable.titleEdgeInsets = UIEdgeInsetsMake(10, 30, 10, screenWidth - 250);
        setLable.setTitleColor(UIColor.black, for: .normal)
        setLable.setTitleColor(UIColor.darkGray, for: .highlighted)
        return setLable
    }
    
    func getLittle(x: CGFloat, y: CGFloat) -> UIButton
    {
        let setLable = UIButton()
        let setCover = UIImage(named: "resource/image/timg")// UIImage.ionicon(with: .setup, textColor: UIColor.darkGray, size: CGSize(width: 40, height: 40))
        setLable.frame = CGRect(x: x, y: y, width: screenWidth / 2, height: screenWidth * 0.39)
        setLable.setImage(setCover, for: .normal)
        // setLable.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, screenWidth - 50);
        setLable.layer.borderWidth = 1
        setLable.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.8).cgColor
        setLable.setTitle("设置", for: .normal)
        // setLable.titleEdgeInsets = UIEdgeInsetsMake(10, 30, 10, screenWidth - 250);
        setLable.setTitleColor(UIColor.black, for: .normal)
        setLable.setTitleColor(UIColor.darkGray, for: .highlighted)
        return setLable
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
