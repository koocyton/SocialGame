//
//  DeceitGameView.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

import AVFoundation

import MediaPlayer

class DeceitGameView: UIView {//, YvChatManageDelegate {
    
    var audioPlayer: AVAudioPlayer? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)
        self.layer.cornerRadius = 10.0
        self.backgroundColor = UIColor.white
        self.alpha = 1
        
        self.addGameScreen()
    }
    
    // let gameScreen = UIView();

    /* override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Deceit Game"
        
        //self.alpha = 0.5
        //self.alp
        
        // override var preferredStatusBarStyle: UIStatusBarStyle
        // UIApplication.shared.statusBarStyle = UIStatusBarStyle.default

        self.addGameScreen()
        // self.view.backgroundColor = UIColor.black;
    } */
    
    func addGameScreen() {
        // let gameScreen = UIView();
        // self.gameScreen.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)


        let goBackImage = UIImage.ionicon(with: .drag, textColor: UIColor.darkGray, size: CGSize(width: 60, height: 20))
        let goBackBtn = UIButton()
        goBackBtn.frame = CGRect(x: screenWidth/2-30, y: 0, width: 30, height: 20)
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        // goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.addSubview(goBackBtn)
        
        // let person1 = UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 60, height: 60))
        
        for ii in 0...5 {
            let y = 40 + ii * 80
            let person1 = UIButton()
            person1.frame = CGRect(x: 10, y: y, width: 70, height: 70)
            person1.setImage(
            UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 70, height: 70)),
            for: .normal)
            person1.layer.cornerRadius = 4
            person1.layer.borderWidth = 1
            person1.layer.borderColor = UIColor.gray.cgColor
            self.addSubview(person1)
        }
        
        for ii in 0...5 {
            let y = 40 + ii * 80
            let x = screenWidth - 80
            let person1 = UIButton()
            person1.frame = CGRect(x: Int(x), y: y, width: 70, height: 70)
            person1.setImage(
                UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 70, height: 70)),
                for: .normal)
            person1.layer.cornerRadius = 4
            person1.layer.borderWidth = 1
            person1.layer.borderColor = UIColor.gray.cgColor
            self.addSubview(person1)
        }
        
        let mic = UIButton()
        mic.frame = CGRect(x: screenWidth/2 - 35, y: screenHeight - 100, width: 70, height: 70)
        mic.setImage(
            UIImage.ionicon(with: .mic, textColor: UIColor.darkGray, size: CGSize(width: 50, height: 50)),
            for: .normal)
        mic.setImage(
            UIImage.ionicon(with: .mic, textColor: UIColor(red: 111/255, green: 237/255, blue: 47/255, alpha: 0.8), size: CGSize(width: 50, height: 50)),
            for: .highlighted)
        mic.layer.cornerRadius = 35
        mic.layer.borderWidth = 1
        mic.layer.borderColor = UIColor.gray.cgColor
        self.addSubview(mic)
        
        // self.view.addSubview(self.gameScreen)
    }
    

    /* 
 override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
        // return UIStatusBarStyle.Default
    }
*/
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

    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //获取手指
        let touch = (touches as NSSet).anyObject() as! UITouch
        let nowLocation = touch.location(in: self)
        let preLocation = touch.previousLocation(in: self)
        
        //获取两个手指的偏移量
        // let offsetX = nowLocation.x - preLocation.x
        let offsetY = nowLocation.y - preLocation.y
        
        var center = self.center
        if (center.y+offsetY-screenHeight/2<20) {
            return;
        }
        // center.x += offsetX
        center.y = center.y + offsetY
        
        /* if (center.y>screenHeight/2+screenHeight/4) {
            self.findController().dismiss(animated: true, completion: nil)
        } */

        self.center = center
    }
    
    func diDong(){
        // let path = Bundle.main.path(forResource: "zjl", ofType: "m4a")
        let url = Bundle.main.url(forResource: "resource/music/didong", withExtension: "mp3")!
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            // self.nohidd()
        }
        catch let error as NSError {
            print(error.description)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (self.frame.origin.y > screenHeight/8) {
            self.slideOut()
        }
        else {
            self.slideInto()
        }
    }
    
    func slideInto()
    {
        if (self.frame.origin.y > 20) {
            let y = self.frame.origin.y - 5
            let time: TimeInterval = 0.0003
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.frame = CGRect(x: 0, y: y, width: screenWidth, height: screenHeight)
                self.slideInto()
            }
        }
        else {
            self.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)
            miniDeceitGameView.slideOut()
            // self.diDong()
            //chatManager.loginBinding(withTT: "ttt", seq: "78765", hasVideo: false, position: 0, videoCount: 0)
        }
    }
    
    func slideOut() {
        if (self.frame.origin.y < screenHeight) {
            let y = self.frame.origin.y + 5
            let time: TimeInterval = 0.0003
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.frame = CGRect(x: 0, y: y, width: screenWidth, height: screenHeight)
                self.slideOut()
            }
        }
        else {
            self.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
            miniDeceitGameView.slideInto()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
