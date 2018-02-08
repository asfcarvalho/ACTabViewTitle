//
//  UIView+Title+Base.swift
//  Oncoclinicas
//
//  Created by Anderson Carvalho on 19/10/17.
//  Copyright © 2017 asfCarvalho. All rights reserved.
//

import UIKit

@IBDesignable
open class UIViewTitleLeft: UIViewTitleRightSecond {
    
    
    
    fileprivate var imgLeft: UIImage?
    fileprivate var imgLeftWidth: Int?
    fileprivate var imgLeftHeigth: Int?
    fileprivate var leftPosition: Int?
    
    
    
    @IBInspectable var imageLeft: UIImage? {
        didSet{
            self.imgLeft = imageLeft
            setupView()
        }
    }
    
    @IBInspectable var imageLeftWidth: Int {
        set{
            self.imgLeftWidth = newValue
            setupView()
        }
        get{
            return self.imgLeftWidth ?? 20
        }
    }
    
    @IBInspectable var imageLeftHeigth: Int {
        set{
            self.imgLeftHeigth = newValue
            setupView()
        }
        get{
            return self.imgLeftHeigth ?? 20
        }
    }
    
    @IBInspectable var leftImgPosition: Int {
        set{
            self.leftPosition = newValue
            setupView()
        }
        get{
            return self.leftPosition ?? 8
        }
    }
    
    @IBAction func buttonLeftTapped(_ sender: UIButton) {
        self.delegate?.btnLeftAction!(sender: sender)
    }
    
    override func setupView() {
        if btnLeft != nil {
            btnLeft?.removeFromSuperview()
        }
        
        let heightTemp = Int((self.frameTemp?.height ?? 20) / 2)
        
        let y = heightTemp - Int((imgLeftHeigth ?? 20) / 2)
        
        btnLeft = UIButton(frame: CGRect(x: (leftPosition ?? 8), y: y, width: imgLeftWidth ?? 20, height: imgLeftHeigth ?? 20))
        
        btnLeft?.touchAreaEdgeInsets = UIEdgeInsets(top: -100, left: -100, bottom: -10, right: -10)
        
        if imgLeft != nil {
            btnLeft?.setImage(imgLeft, for: .normal)
            btnLeft?.addTarget(self, action: #selector(buttonLeftTapped(_:)), for: .touchUpInside)
            btnLeft?.clipsToBounds = false
            self.addSubview(btnLeft ?? UIButton())
        }
        
        super.setupView()
    }
    
    
}

private var pTouchAreaEdgeInsets: UIEdgeInsets = .zero

extension UIButton {
    
    var touchAreaEdgeInsets: UIEdgeInsets {
        get {
            if let value = objc_getAssociatedObject(self, &pTouchAreaEdgeInsets) as? NSValue {
                var edgeInsets: UIEdgeInsets = .zero
                value.getValue(&edgeInsets)
                return edgeInsets
            }
            else {
                return .zero
            }
        }
        set(newValue) {
            var newValueCopy = newValue
            let objCType = NSValue(uiEdgeInsets: .zero).objCType
            let value = NSValue(&newValueCopy, withObjCType: objCType)
            objc_setAssociatedObject(self, &pTouchAreaEdgeInsets, value, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if UIEdgeInsetsEqualToEdgeInsets(self.touchAreaEdgeInsets, .zero) || !self.isEnabled || self.isHidden {
            return super.point(inside: point, with: event)
        }
        
        let relativeFrame = self.bounds
        let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.touchAreaEdgeInsets)
        
        return hitFrame.contains(point)
    }
}

