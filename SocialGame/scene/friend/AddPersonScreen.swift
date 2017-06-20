//
//  addPerson.swift
//  SocialGame
//
//  Created by 刘毅 on 2017/6/14.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

class AddPersonScreen: UIViewController {

    var name : String = ""
    
    var key  : Int   = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.title = "Add Person"
        self.view.backgroundColor = UIColor.white
        
        let goBackImage = UIImage.ionicon(with: .go_back, textColor: UIColor.white, size: CGSize(width: 30, height: 30))
        let goBackBtn = UIButton()
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: goBackBtn)
        

        let searchLable = UIButton()
        searchLable.frame = CGRect(x: -1, y: centerViewY - 1, width: screenWidth, height: 50)
        searchLable.layer.borderWidth = 1
        searchLable.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.8).cgColor
        // let searchInput = UIInputView()
        // searchInput.frame = CGRect(x: 10, y: 10 , width: screenWidth - 20, height: 30)
        // searchInput.inputViewStyle = .keyboard
        // searchLable.addSubview(searchInput)
        
        searchLable.setTitle("点击搜索", for: .normal)
        searchLable.setTitleColor(UIColor.darkGray, for: .highlighted)
        searchLable.setTitleColor(UIColor.black, for: .normal)
        searchLable.titleEdgeInsets = UIEdgeInsetsMake(10, -30, 10, 0);
        
        let searchImage = UIImage.ionicon(with: .search, textColor: UIColor.darkGray, size: CGSize(width: 25, height: 25))
        searchLable.imageEdgeInsets = UIEdgeInsetsMake(10, screenWidth/2, 10, 0);
        searchLable.setImage(searchImage, for: .normal)
        

        self.view.addSubview(searchLable)
        
        let fbLable = UIButton()
        let fbCover = UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 40, height: 40))
        fbLable.frame = CGRect(x: -1, y: 200, width: screenWidth+2, height: 60)
        // fbLable.addSubview(fbCover)
        fbLable.setImage(fbCover, for: .normal)
        fbLable.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, screenWidth - 50);
        fbLable.layer.borderWidth = 1
        fbLable.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.8).cgColor
        fbLable.setTitle("添加 Facebook 好友", for: .normal)
        //button标题的偏移量，这个偏移量是相对于图片的
        fbLable.titleEdgeInsets = UIEdgeInsetsMake(10, 30, 10, screenWidth - 250);
        //设置button正常状态下的标题颜色
        fbLable.setTitleColor(UIColor.black, for: .normal)
        fbLable.setTitleColor(UIColor.darkGray, for: .highlighted)
        //设置button高亮状态下的标题颜色
        // fbLable.setTitleColor(UIColor.black, for: .application)
        //
        // fbLable.titleLabel?.font = 14
        self.view.addSubview(fbLable)
        
        
        let twLable = UIButton()
        let twCover = UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 40, height: 40))
        twLable.frame = CGRect(x: -1, y: 259, width: screenWidth+2, height: 60)
        // fbLable.addSubview(fbCover)
        twLable.setImage(twCover, for: .normal)
        twLable.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, screenWidth - 50);
        twLable.layer.borderWidth = 1
        twLable.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.8).cgColor
        twLable.setTitle("添加 Twitter 好友", for: .normal)
        //button标题的偏移量，这个偏移量是相对于图片的
        twLable.titleEdgeInsets = UIEdgeInsetsMake(10, 30, 10, screenWidth - 250);
        //设置button正常状态下的标题颜色
        twLable.setTitleColor(UIColor.black, for: .normal)
        twLable.setTitleColor(UIColor.darkGray, for: .highlighted)
        //设置button高亮状态下的标题颜色
        // fbLable.setTitleColor(UIColor.black, for: .application)
        //
        // fbLable.titleLabel?.font = 14
        self.view.addSubview(twLable)
        
        let wxLable = UIButton()
        let wxCover = UIImage.ionicon(with: .person, textColor: UIColor.darkGray, size: CGSize(width: 40, height: 40))
        wxLable.frame = CGRect(x: -1, y: 318, width: screenWidth+2, height: 60)
        wxLable.setImage(wxCover, for: .normal)
        wxLable.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, screenWidth - 50);
        wxLable.layer.borderWidth = 1
        wxLable.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.8).cgColor
        wxLable.setTitle("添加 Wechat 好友", for: .normal)
        wxLable.titleEdgeInsets = UIEdgeInsetsMake(10, 30, 10, screenWidth - 250);
        wxLable.setTitleColor(UIColor.black, for: .normal)
        wxLable.setTitleColor(UIColor.darkGray, for: .highlighted)
        self.view.addSubview(wxLable)
        
        /*
        let goBackImage = UIImage.ionicon(with: .go_back, textColor: UIColor.darkGray, size: CGSize(width: 21, height: 21))
        let goBackBtn = UIButton()
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: goBackBtn)
        
        
        
        let bb = UIImage.ionicon(with: .add_person, textColor: UIColor.darkGray, size: CGSize(width: 21, height: 21))
        let bbBtn = UIButton()
        bbBtn.setImage(bb, for: .normal)
        bbBtn.sizeToFit()
        bbBtn.frame = CGRect(x: 40, y: 190, width: 30, height: 30)
        let tt = UITextView()
        tt.isEditable = false
        tt.text = "Add Facebook Friend"
        tt.frame = CGRect(x: 130, y: 190, width: 150, height: 30)
        bbBtn.addTarget(self, action:#selector(self.addFacebookFriend), for:.touchUpInside)
        self.view.addSubview(bbBtn)
        self.view.addSubview(tt)
        */
    }

    func addFacebookFriend() {
        
        
    }

    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
