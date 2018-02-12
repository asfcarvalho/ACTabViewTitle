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
    
    
    
    @IBInspectable open var imageLeft: UIImage? {
        didSet{
            self.imgLeft = imageLeft
            setupView()
        }
    }
    
    @IBInspectable open var imageLeftWidth: Int {
        set{
            self.imgLeftWidth = newValue
            setupView()
        }
        get{
            return self.imgLeftWidth ?? 20
        }
    }
    
    @IBInspectable open var imageLeftHeigth: Int {
        set{
            self.imgLeftHeigth = newValue
            setupView()
        }
        get{
            return self.imgLeftHeigth ?? 20
        }
    }
    
    @IBInspectable open var leftImgPosition: Int {
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
            self.btnLeft?.removeFromSuperview()
        }
        
        let heightTemp = Int((self.frameTemp?.height ?? 44) / 2)
        
        let y = Int(abs(heightTemp - Int((imgLeftHeigth ?? 20) / 2)))
        
        btnLeft = UIButton(frame: CGRect(x: (leftPosition ?? 8), y: y, width: imgLeftWidth ?? 44, height: imgLeftHeigth ?? 44))

        if imgLeft != nil {
            btnLeft?.setImage(imgLeft, for: .normal)
            btnLeft?.addTarget(self, action: #selector(buttonLeftTapped(_:)), for: .touchUpInside)
            self.addSubview(btnLeft ?? UIButton())
        }
        
        super.setupView()
    }    
}

