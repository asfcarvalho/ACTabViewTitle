//
//  UIView+Title+Right.swift
//  Oncoclinicas
//
//  Created by Anderson Carvalho on 19/10/17.
//  Copyright © 2017 asfCarvalho. All rights reserved.
//

import UIKit

@IBDesignable
open class UIViewTitleRight: UIViewTitleText {

    fileprivate var imgRight: UIImage?
    fileprivate var imgRightWidth: Int?
    fileprivate var imgRightHeigth: Int?
        

    
    @IBInspectable var imageRight: UIImage? {
        didSet{
            self.imgRight = imageRight
            setupView()
        }
    }
    
    @IBInspectable var imageRightWidth: Int {
        set{
            self.imgRightWidth = newValue
            setupView()
        }
        get{
            return self.imgRightWidth ?? 20
        }
    }
    
    @IBInspectable var imageRightHeigth: Int {
        set{
            self.imgRightHeigth = newValue
            setupView()
        }
        get{
            return self.imgRightHeigth ?? 20
        }
    }
    
    @IBInspectable var rightImgPosition: Int {
        set{
            self.rightPosition = newValue
            setupView()
        }
        get{
            return self.rightPosition ?? 8
        }
    }
    
    @IBAction func buttonRightTapped(_ sender: UIButton) {
        self.delegate?.btnRightAction!(sender: sender)
    }
    
    override func setupView() {
        
        
        if btnRigth != nil {
            btnRigth?.removeFromSuperview()
        }
        
        let yHeigth = Int((self.frameTemp?.height ?? 0) / 2)
        let y = yHeigth - Int((imgRightHeigth ?? 20) / 2)
        let width = Int((self.frameTemp?.width ?? 0))
        xRigth = width - ((imgRightWidth ?? 20) + (rightPosition ?? 8))
        
        btnRigth = UIButton(frame: CGRect(x: xRigth, y: y, width: imgRightWidth ?? 20, height: imgRightHeigth ?? 20))
        
        if imgRight != nil {
            btnRigth?.setImage(imgRight, for: .normal)
            btnRigth?.addTarget(self, action: #selector(buttonRightTapped(_:)), for: .touchUpInside)
            
            
            self.addSubview(btnRigth ?? UIButton())
        }
        
        super.setupView()
    }
}

