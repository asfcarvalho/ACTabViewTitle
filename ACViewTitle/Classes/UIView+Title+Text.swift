//
//  UIView+Title+Text.swift
//  Oncoclinicas
//
//  Created by Anderson Carvalho on 19/10/17.
//  Copyright © 2017 asfCarvalho. All rights reserved.
//

import UIKit

@IBDesignable
open class UIViewTitleText: UIViewTitleBase {
    
    fileprivate var lblTitle: String?
    fileprivate var fontSize: CGFloat = 13.0
    fileprivate var fontDefault = UIFont.systemFont(ofSize: 13)
    fileprivate var colorText: UIColor!
    fileprivate var alignment: String?
    fileprivate var autoSize: Bool = false
    


    @IBInspectable var labelTitle: String {
        set{
            self.lblTitle = newValue
            setupView()
        }
        get{
            return self.lblTitle ?? ""
        }
    }
    
    @IBInspectable var adjusteSize: Bool {
        set{
            self.autoSize = newValue
            setupView()
        }
        get{
            return self.autoSize
        }
    }
    
    @IBInspectable var fontName: String? {
        didSet {
            self.fontDefault = UIFont(name: fontName ?? self.fontDefault.fontName, size: labelSize) ?? self.fontDefault
            setupView()
        }
    }
    
    @IBInspectable var labelSize: CGFloat {
        set{
            
            self.fontSize = newValue
            setupView()
            
        }
        get{
            return self.fontSize
        }
    }
    
    @IBInspectable var labelColor: UIColor? {
        didSet{
            self.colorText = labelColor ?? UIColor.black
            setupView()
        }
    }
    
    @IBInspectable var textAlignment: String? {
        didSet{
            self.alignment = textAlignment
            setupView()
        }
    }
    
    func getOrientation() -> NSTextAlignment{
        switch alignment ?? "" {
        case "center":
            return NSTextAlignment.center
        case "left":
            return NSTextAlignment.left
        case "right":
            return NSTextAlignment.right
        default:
            return NSTextAlignment.left            
        }
    }
    
    @objc func setupView() {
        
        if lblTitleMenu != nil {
            lblTitleMenu?.removeFromSuperview()
        }
        
        let xWidth = Int(btnLeft?.frame.width ?? 8)
        let xMin = Int(btnLeft?.frame.minX ?? 0)
        let xWidthxMin = xWidth + xMin
        var x = xWidthxMin + 27
        
        if getOrientation() == .center {
            x = 0
        }
        
        let yHeight = Int((self.frameTemp?.height ?? 44) / 2)
        
        lblTitleMenu = UILabel(frame: CGRect(x: x, y: yHeight - 22, width: (xRigthSecond ?? xRigth) - x - 20, height: Int((self.frameTemp?.height ?? 44))))
        
        
        self.lblTitleMenu?.textColor = labelColor
        self.lblTitleMenu?.font = UIFont(name: self.fontDefault.fontName, size: self.fontSize)
        
        self.lblTitleMenu?.adjustsFontSizeToFitWidth = self.autoSize
        if self.autoSize {
            self.lblTitleMenu?.minimumScaleFactor = 0.5
        }
        
        if lblTitle != nil {
            self.lblTitleMenu?.text = lblTitle ?? ""
            self.lblTitleMenu?.textAlignment = getOrientation()
            
            
            self.addSubview(lblTitleMenu ?? UILabel())
        }
        
        self.setNeedsLayout()
        self.setNeedsDisplay()
        self.layoutIfNeeded()
    }
}
