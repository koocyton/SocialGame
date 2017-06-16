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
        
        let goBackImage = UIImage.ionicon(with: .go_back, textColor: UIColor.darkGray, size: CGSize(width: 21, height: 21))
        let goBackBtn = UIButton()
        goBackBtn.setImage(goBackImage, for: .normal)
        goBackBtn.sizeToFit()
        goBackBtn.addTarget(self, action:#selector(self.goBack), for:.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: goBackBtn)
        
        self.view.backgroundColor = UIColor.white
        
        let bb = UIImage.ionicon(with: .add_person, textColor: UIColor.darkGray, size: CGSize(width: 21, height: 21))
        let bbBtn = UIButton()
        bbBtn.setImage(bb, for: .normal)
        bbBtn.sizeToFit()
        bbBtn.frame = CGRect(x: 40, y: 190, width: 30, height: 30)
        let tt = UITextView()
        tt.text = "Add Facebook Friend"
        tt.frame = CGRect(x: 130, y: 190, width: 150, height: 30)
        bbBtn.addTarget(self, action:#selector(self.addFacebookFriend), for:.touchUpInside)
        self.view.addSubview(bbBtn)
        self.view.addSubview(tt)
        
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
