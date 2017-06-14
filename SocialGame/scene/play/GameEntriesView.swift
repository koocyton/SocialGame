
import UIKit


class GameListView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    let deceitGameView : DeceitGameView

    init(frame: CGRect, layout: UICollectionViewLayout) {

        self.deceitGameView = DeceitGameView()

        super.init(frame: frame, collectionViewLayout: layout)
        
        // self.init(frame: self.layer.bounds, collectionViewLayout: layout)
        self.frame = CGRect(x: 0, y: 0, width: centerViewWidth, height: centerViewHeight)
        self.backgroundColor = UIColor.white
        // delegate
        self.delegate = self
        self.dataSource = self
        //注册一个cell
        self.register(GameCell.self, forCellWithReuseIdentifier:"GameCell")
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
        self.findNavigator()?.pushViewController(self.deceitGameView, animated: true)
        // self.findController().hidesBottomBarWhenPushed = false
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // default cover
        // let ii : Int = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
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


class GameCell: UICollectionViewCell {
    
    var cover = UIImageView()
    
    // var title = UILabel()
    
    // var intro = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageHeight = cellHeight - 20
        
        // 封面图
        cover = UIImageView.init(frame: self.layer.bounds)
        cover.frame = CGRect(x: 10, y: 10, width: imageHeight, height: imageHeight)
        cover.image = UIImage(named: "resource/image/chrome")
        self.addSubview(cover)
        
        // 标题
        // title.frame = CGRect(x: imageHeight + 20 + 10, y: 10, width: screenWidth - imageHeight - 30, height: 20)
        // title.text = "标题"
        // title.textAlignment = NSTextAlignment.center
        // title.textColor = UIColor.lightGray
        //self.addSubview(title)
        
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
