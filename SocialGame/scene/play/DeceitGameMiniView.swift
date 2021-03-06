//
//  DeceitGameMiniView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/22.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class DeceitGameMiniView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: -1, y: screenHeight, width: screenWidth + 2, height: 60)
        self.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 0.5)

        // 毛玻璃效果
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0, y: 0, width: screenWidth + 2, height: 60)
        // blurView.layer.cornerRadius = 4
        // blurView.layer.borderWidth = 1;
        self.addSubview(blurView)

        // self.layer.cornerRadius = 4
        self.layer.borderWidth = 1;
        self.layer.borderColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 0.5).cgColor;
        
        let face = UIImageView(image:UIImage(named: "resource/image/timg"))
        face.frame = CGRect(x:5, y:5, width:50, height:50)
        self.addSubview(face)
        
        let fayan = UITextView()
        fayan.text = "方汉正在发言"
        fayan.sizeToFit()
        fayan.isUserInteractionEnabled = false
        fayan.isEditable = false
        fayan.backgroundColor = UIColor.clear
        fayan.frame = CGRect(x:60, y:15, width:100, height:30)
        self.addSubview(fayan)
        
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    func tapGestureAction() {
        deceitGameView.slideInto()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //获取手指
        let touch = (touches as NSSet).anyObject() as! UITouch
        let nowLocation = touch.location(in: self)
        let preLocation = touch.previousLocation(in: self)
        
        //获取两个手指的偏移量
        let offsetX = nowLocation.x - preLocation.x
        // let offsetY = nowLocation.y - preLocation.y
        var center = self.center

        // center.x += offsetX
        center.x = center.x + offsetX
        self.center = center
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (self.frame.origin.x > screenWidth/3 || self.frame.origin.x < 0 - screenWidth/3) {
            self.slideOut()
        }
        else {
            self.slideInto()
        }
    }
    
    func slideInto() {
        if (self.frame.origin.y > screenHeight - 109) {
            let y = self.frame.origin.y - 1
            // print(y, self.layer.position.y, screenHeight)
            let time: TimeInterval = 0.0003
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.frame.origin.y = y
                self.slideInto()
            }
        }
        else {
            self.frame.origin.y = screenHeight - 109
            self.frame.origin.x = -1
        }
    }
    
    func slideOut() {
        self.frame.origin.y = screenHeight
        self.frame.origin.x = -1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
