//
//  CTView.swift
//  TasteStories
//
//  Created by fanzz on 16/6/26.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit
import CoreText

/**
 *使用时需要通过setter方法对texts进行赋值，默认是字体为竖直方向，文本较多时应该设置文本数组为一个，文本首行缩进的话需要在文本首行敲进去4个空格。
 */

class CTView: UIView {
    
    private var isVertical:Bool = false
    
    private var texts:[NSString] = ["岁月凝涵香,佛渡慈航","焚香祈愿,轻诉卷章","回望间,溢彷徨","诗意涟漪,纵生芸芸","前世今生,焉能忘？"]
    
    
    private var font = UIFont(name: "Arial", size: 40)

    
    func setIsVertical(flag:Bool){
        self.isVertical = flag
    }
    func setTexts(flag:[NSString]){
        self.texts = flag
    }
    func setFont(flag:UIFont){
        self.font = flag
    }
    
    
    func insertEnterToString(text:String,index:Int)
    {
    
        let char = text.characters
        var newchar:String = ""
        for item in char{
            newchar+="\(item)\n"
            
        }
        self.texts[index] = newchar
    
    }
    
    private var dataArr:NSMutableArray = NSMutableArray()
    
    private var numArr:NSMutableArray = NSMutableArray()
    private var textLayers:[CATextLayer] = [CATextLayer]()
    
    
    
    
   override  func drawRect(rect: CGRect) {
    
    super.drawRect(rect)
    
    
    let textsCount = texts.count
    
    for index in 0..<textsCount{
        
        let delta = Double(NSEC_PER_SEC)*Double(index)*2.0
        let dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(delta))
        dispatch_after(dtime,dispatch_get_main_queue() , {
            Void in
            print("1111：：：延迟2秒执行")
            
            let textLayer = CATextLayer()
            self.textLayers.append(textLayer)
            
            if self.isVertical {
                
                self.insertEnterToString(self.texts[index] as String,index: index)
            let width = self.frame.width/CGFloat(textsCount)
            textLayer.frame = CGRect(x: self.frame.width-width*CGFloat(index+1), y:0, width: width, height: self.frame.height)
                textLayer.alignmentMode = kCAAlignmentCenter

            }else{
                let height = self.frame.height/CGFloat(textsCount)
                textLayer.frame = CGRect(x: 0, y:CGFloat(index)*height, width: self.frame.width, height: height)
                textLayer.alignmentMode = kCAAlignmentJustified

            }
            self.layer.addSublayer(textLayer)
            textLayer.wrapped = true
            
            
            let str = self.texts[index]
            
            let string = NSMutableAttributedString(string: str as String)
            let fontName = self.font!.fontName
            let fontSize = self.font!.pointSize
            
            let fontRef = CTFontCreateWithName(fontName, fontSize, nil)
            let attribs:[String:AnyObject] = [kCTForegroundColorAttributeName as String:UIColor.clearColor().CGColor,kCTFontAttributeName as String:fontRef]
            string.addAttributes(attribs, range: NSMakeRange(0,         str.length))
            let arr = NSMutableArray(objects: fontRef,attribs,string,str,textLayer)
            self.dataArr.addObject(arr)
            
            let nums = NSMutableArray()
            self.numArr.addObject(nums)
            
            for i in 0..<str.length{
                self.numArr[index].addObject(i)
                self.performSelector(#selector(CTView.changeToBack(_:)), withObject:"\(index)",afterDelay: 0.1*Double(i))
            }
   
            
        })
             }
    }
    func changeToBack(index:NSString)
    {
        let attr = dataArr[index.integerValue] as! NSMutableArray
        
        let fontRef = attr[0]
        let string = attr[2] as! NSMutableAttributedString
        let num = numArr[index.integerValue].firstObject
        let y = num as! Int
        var attribs = attr[1] as! [String:AnyObject]
        
        attribs = [kCTForegroundColorAttributeName as String:UIColor.blackColor().CGColor,kCTFontAttributeName as String:fontRef]
        
        string.addAttributes(attribs , range: NSMakeRange(y, 1))
        
        if numArr[index.integerValue].count > 1 {
            numArr[index.integerValue].removeObjectAtIndex(0)
        }
        let textLayer:CATextLayer = dataArr[index.integerValue].lastObject as! CATextLayer
        textLayer.string = string
        
        
        
    }


}


