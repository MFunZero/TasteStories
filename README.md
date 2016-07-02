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



![image](https://github.com/suzee/TasteStories/blob/master/CTDemo/image/dynamic.gif)
