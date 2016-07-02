# TasteStories
通过CoreText定义可以竖直或者横向字体逐字显示的图层
使用：

        let vi = CTView(frame: CGRect(x: left, y: top, width: screenW - left*2, height: screenH - top*1.5))
        self.view.addSubview(vi)
        vi.backgroundColor = UIColor.clearColor()
        
        vi.setFont(UIFont(name: "TamilSangamMN", size: 34)!)
        
        vi.setIsVertical(true)//设置是否是竖直方向，不设置时默认为横向
        
        let texts = ["岁月凝涵香,佛渡慈航","焚香祈愿,轻诉卷章","回望间,溢彷徨","诗意涟漪,纵生芸芸","前世今生,焉能忘？"]
        vi.setTexts(texts)//设置显示字体内容



![image](https://github.com/suzee/TasteStories/blob/master/CTDemo/image/7165329428.gif)
![image](https://raw.githubusercontent.com/suzee/TasteStories/22c4e025f8e6ae25fe0bd6bbbc367894af337c9f/CTDemo/image/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%8828%E6%97%A5%20%E4%B8%8B%E5%8D%883.37.29.png)
![image](https://raw.githubusercontent.com/suzee/TasteStories/22c4e025f8e6ae25fe0bd6bbbc367894af337c9f/CTDemo/image/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%8828%E6%97%A5%20%E4%B8%8B%E5%8D%883.37.47.png)
![image](https://raw.githubusercontent.com/suzee/TasteStories/22c4e025f8e6ae25fe0bd6bbbc367894af337c9f/CTDemo/image/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%8828%E6%97%A5%20%E4%B8%8B%E5%8D%883.37.53.png)
![image](https://raw.githubusercontent.com/suzee/TasteStories/22c4e025f8e6ae25fe0bd6bbbc367894af337c9f/CTDemo/image/Simulator%20Screen%20Shot%202016%E5%B9%B46%E6%9C%8828%E6%97%A5%20%E4%B8%8B%E5%8D%883.37.57.png)
