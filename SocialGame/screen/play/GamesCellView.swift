
import UIKit

class GamesCellView : UIScrollView, UIScrollViewDelegate {
    
    var timer: Timer!
    
    var fromOffsetX : CGFloat = 0
    var toOffsetX : CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // x , y , width , height
        self.frame = CGRect(x: 0, y: statusBarHeight + scrollLabelHeight, width: screenWidth, height: channelContentHeight)
        // 滑动区的内容区的大小
        self.contentSize = CGSize(width: CGFloat(channelCount) * screenWidth , height:channelContentHeight)
        // 背景色
        self.backgroundColor = UIColor.darkGray
        // 是否按页滚动
        self.isPagingEnabled = true
        // 水平滚动，而不显示滚动条
        self.alwaysBounceHorizontal = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        self.tag = 63
        //
        self.delegate = self
        // self.selec = 0
        
        for ii in 0..<channelModel.data.count {
            // 初始化
            let oneChannelView = OneChannelView.init(frame: self.layer.bounds, layout: OneChannelLayout(), index: ii)
            // 大小, 坐标
            oneChannelView.frame = CGRect(x: CGFloat(ii) * screenWidth, y: 0, width: screenWidth, height: channelContentHeight)
            oneChannelView.contentSize = CGSize(width: screenWidth , height:channelContentHeight-200)
            // oneChannelView.scrollRectToVisible(<#T##rect: CGRect##CGRect#>, animated: <#T##Bool#>)
            //oneChannelView.delegate = oneChannelView
            //oneChannelView.dataSource = oneChannelView
            // oneChannelView.cellData = channel
            oneChannelView.tag = 100 + ii
            // 添加到界面
            self.addSubview(oneChannelView)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if scrollView.contentOffset.x < scrollLabelWidth {
            return
        }
        
        if scrollView.contentOffset.x > screenWidth * CGFloat(channelCount - 1) - scrollLabelWidth{
            return
        }
        
        // 宽度的倍数
        let offsetWidthTimes : CGFloat = scrollView.contentOffset.x / screenWidth
        
        // 当前滑动页面第几页
        let offsetLeftTimes : Int = Int(floor(offsetWidthTimes))
        // 当前滑动页右边是第几页
        let offsetRightTimes : Int = Int(ceil(offsetWidthTimes))
        
        // 当前页的 label 文字大小
        let offsetLeftSize : CGFloat = 15 + (CGFloat(offsetRightTimes) - offsetWidthTimes) * 5
        // 当前页右侧的 label 文字大小
        let offsetRightSize : CGFloat = 15 + (offsetWidthTimes - CGFloat(offsetLeftTimes)) * 5
        
        // 当前页的 label 文字颜色
        let offsetLeftColor : CGFloat = (200 + 55 * (CGFloat(offsetRightTimes) - offsetWidthTimes)) / 255
        // 当前页右侧的 label 文字颜色
        let offsetRightColor : CGFloat = (200 + 55 * (offsetWidthTimes - CGFloat(offsetLeftTimes))) / 255
        
        // 左边(当前)页面
        let leftLabelView : ChannelMenuLabel = self.superview?.viewWithTag(1000 + offsetLeftTimes) as! ChannelMenuLabel
        // 右边页
        let rightLabelView : ChannelMenuLabel = self.superview?.viewWithTag(1000 + offsetRightTimes) as! ChannelMenuLabel
        
        if offsetLeftTimes != offsetRightTimes {
            
            leftLabelView.font = UIFont.systemFont(ofSize: offsetLeftSize)
            rightLabelView.font = UIFont.systemFont(ofSize: offsetRightSize)
            
            leftLabelView.textColor = UIColor(red: offsetLeftColor, green: offsetLeftColor, blue: offsetLeftColor, alpha: 1)
            rightLabelView.textColor = UIColor(red: offsetRightColor, green: offsetRightColor, blue: offsetRightColor, alpha: 1)
        }
        else {
            currentChannelIndex = offsetLeftTimes
            
            let channelMenuView : ChannelMenuView = self.superview?.viewWithTag(110) as! ChannelMenuView
            
            let currentChannelOffsetX : CGFloat = CGFloat(currentChannelIndex) * scrollLabelWidth
            
            let bb = screenWidth.truncatingRemainder(dividingBy: scrollLabelWidth)
            
            let cc = Int(floor(screenWidth / scrollLabelWidth))
            
            // self.timer.invalidate()
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            
            if currentChannelOffsetX < channelMenuView.contentOffset.x + scrollLabelWidth {
                // channelMenuView.contentOffset.x = currentChannelOffsetX
                self.fromOffsetX = channelMenuView.contentOffset.x
                self.toOffsetX = currentChannelOffsetX - scrollLabelWidth
                
                self.timer = Timer.scheduledTimer(timeInterval: 0.0015,
                                                  target:self,
                                                  selector:#selector(slideChannelMenu),
                                                  userInfo:nil,
                                                  repeats:true)
            }
            
            if currentChannelOffsetX + scrollLabelWidth > channelMenuView.contentOffset.x + screenWidth - scrollLabelWidth{
                // channelMenuView.contentOffset.x = CGFloat(channelCount) * scrollLabelWidth - CGFloat(channelCount - currentChannelIndex + cc ) * scrollLabelWidth + (scrollLabelWidth - bb)
                
                self.fromOffsetX = channelMenuView.contentOffset.x
                self.toOffsetX = CGFloat(channelCount) * scrollLabelWidth - CGFloat(channelCount - currentChannelIndex + cc ) * scrollLabelWidth + (scrollLabelWidth - bb) + scrollLabelWidth
                
                self.timer = Timer.scheduledTimer(timeInterval: 0.0015,
                                                  target:self,
                                                  selector:#selector(slideChannelMenu),
                                                  userInfo:nil,
                                                  repeats:true)
            }
            // print(CGFloat(currentChannelIndex) * scrollLabelWidth, channelMenuView.contentOffset.x)
        }
        
        
    }
    
    func slideChannelMenu() {
        
        let channelMenuView : ChannelMenuView = self.superview?.viewWithTag(110) as! ChannelMenuView
        
        if ( self.fromOffsetX < self.toOffsetX ) {
            if channelMenuView.contentOffset.x >= self.toOffsetX {
                channelMenuView.contentOffset.x = self.toOffsetX
                self.timer.invalidate()
                self.timer = nil
            }
            else {
                channelMenuView.contentOffset.x = channelMenuView.contentOffset.x + 1
            }
        }
        
        if ( self.fromOffsetX > self.toOffsetX ) {
            if channelMenuView.contentOffset.x <= self.toOffsetX {
                channelMenuView.contentOffset.x = self.toOffsetX
                self.timer.invalidate()
                self.timer = nil
            }
            else {
                channelMenuView.contentOffset.x = channelMenuView.contentOffset.x - 1
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OneChannelLayout : UICollectionViewFlowLayout {
    
    override init() {
        super.init();
        //滚动方向
        self.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        self.itemSize = CGSize(width:screenWidth, height: cellHeight )
        //上下间隔
        self.minimumLineSpacing = 0
        //左右间隔
        self.minimumInteritemSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class OneChannelView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let index: Int
    
    init(frame: CGRect, layout: UICollectionViewLayout, index: Int) {
        
        self.index = index
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        // self.init(frame: self.layer.bounds, collectionViewLayout: layout)
        self.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: channelContentHeight)
        self.backgroundColor = UIColor.white
        // delegate
        self.delegate = self
        self.dataSource = self
        //注册一个cell
        self.register(HotCell.self, forCellWithReuseIdentifier:"HotCell")
    }
    
    // 有多少个 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelModel.data[index]["content"].count
    }
    
    // 点击 cell 的时候
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let channelAudioView : ChannelAudioView = self.superview?.superview?.viewWithTag(51) as! ChannelAudioView
        channelAudioView.play()
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // default cover
        let ii : Int = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotCell", for: indexPath) as! HotCell
        cell.frame = CGRect(x: 0, y: indexPath.row * Int(cellHeight), width: Int(screenWidth), height: Int(cellHeight))
        cell.title.text = "\(channelModel.data[index]["content"][ii]["title"])"
        cell.intro.text = "\(channelModel.data[index]["content"][ii]["introduction"])"
        // cell.layer.borderColor = UIColor.gray.cgColor
        // cell.layer.borderWidth = 1
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class HotCell: UICollectionViewCell {
    
    var cover = UIImageView()
    
    var title = UILabel()
    
    var intro = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageHeight = cellHeight - 20
        
        // 封面图
        cover = UIImageView.init(frame: self.layer.bounds)
        cover.frame = CGRect(x: 10, y: 10, width: imageHeight, height: imageHeight)
        cover.image = UIImage(named: "normal")
        self.addSubview(cover)
        
        // 标题
        title.frame = CGRect(x: imageHeight + 20 + 10, y: 10, width: screenWidth - imageHeight - 30, height: 20)
        // title.text = "标题"
        // title.textAlignment = NSTextAlignment.center
        // title.textColor = UIColor.lightGray
        self.addSubview(title)
        
        // 介绍
        intro.frame = CGRect(x: imageHeight + 30, y: 40, width: screenWidth - imageHeight - 40, height: imageHeight - 30)
        // intro.text = "这里放好听的歌的介绍"
        intro.textAlignment = NSTextAlignment.left
        intro.textColor = UIColor.lightGray
        // intro.backgroundColor = UIColor.blue
        self.addSubview(intro)
        
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
