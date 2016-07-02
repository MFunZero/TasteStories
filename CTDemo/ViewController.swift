//
//  ViewController.swift
//  CTDemo
//
//  Created by fanzz on 16/7/1.
//  Copyright © 2016年 fanzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printFontFamily()//
        
        let screenSize = UIScreen.mainScreen().bounds
        let screenW = screenSize.width
        let screenH = screenSize.height
        
        let left:CGFloat = 20.0
        let top:CGFloat = 20

        let vi = CTView(frame: CGRect(x: left, y: top, width: screenW - left*2, height: screenH - top*1.5))
        self.view.addSubview(vi)
        vi.backgroundColor = UIColor.clearColor()
        
        vi.setFont(UIFont(name: "TamilSangamMN", size: 34)!)
        
        vi.setIsVertical(true)//设置是否是竖直方向，不设置时默认为横向
        
        let texts = ["岁月凝涵香,佛渡慈航","焚香祈愿,轻诉卷章","回望间,溢彷徨","诗意涟漪,纵生芸芸","前世今生,焉能忘？"]
        vi.setTexts(texts)//设置显示字体内容
    }

    func printFontFamily(){
        let a = UIFont.familyNames()
        for b in a {
            print("family: \(b)")
            let c  = UIFont.fontNamesForFamilyName(b as String)
            for d in c {
                print("\tfont = \(d)")
            }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

