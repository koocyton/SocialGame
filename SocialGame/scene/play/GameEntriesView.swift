
import UIKit


class GameListView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    // let deceitGameView : DeceitGameView

    init(frame: CGRect, layout: UICollectionViewLayout) {

        // self.deceitGameView = DeceitGameView()

        super.init(frame: frame, collectionViewLayout: layout)
        
        self.alpha = 1
        
        // self.init(frame: self.layer.bounds, collectionViewLayout: layout)
        self.frame = CGRect(x: 0, y: 0, width: centerViewWidth, height: centerViewHeight)
        self.backgroundColor = UIColor.white
        // delegate
        self.delegate = self
        self.dataSource = self
        //注册一个cell
        self.register(GameCell.self, forCellWithReuseIdentifier:"GameCell")
        
        
        // self.addSubview(self.deceitGameView)
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    // 点击 cell 的时候
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        // deceitGameView.slideInto()
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class GameCell: UICollectionViewCell {
    
    var cover = UIImageView()
    
    var title = UILabel()
    
    var joinBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageWidth = screenWidth / 2
        
        // 标题
        title.frame = CGRect(x: 0, y: 10, width: screenWidth, height: screenWidth / 8)
        title.text = "Were Wolf"
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor.black
        self.addSubview(title)

        // 封面图
        // cover = UIImageView.init(frame: self.layer.bounds)
        cover.frame = CGRect(x: screenWidth / 4, y: screenWidth / 4, width: imageWidth, height: imageWidth)
        cover.image = UIImage(named: "resource/image/timg")
        self.addSubview(cover)

        // 按钮
        joinBtn.frame = CGRect(x: (screenWidth-170)/2, y: screenWidth - screenWidth / 6, width: 170, height: 40)
        joinBtn.setTitle("我是狼 ...", for: .normal)
        joinBtn.setTitleColor(UIColor.black, for: .normal)
        joinBtn.tintColor = UIColor.black
        joinBtn.layer.cornerRadius = 4
        joinBtn.layer.borderWidth = 1
        joinBtn.layer.borderColor = UIColor.black.cgColor
        joinBtn.addTarget(deceitGameView, action:#selector(deceitGameView.slideInto), for:.touchUpInside)
        self.addSubview(joinBtn)
        
        // 插入下划线
        let hrView = UIView(frame: (self.layer.bounds))
        hrView.frame = CGRect(x: 0, y: self.layer.bounds.size.height, width: screenWidth, height: 1)
        hrView.layer.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 0.8).cgColor
        self.addSubview(hrView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
