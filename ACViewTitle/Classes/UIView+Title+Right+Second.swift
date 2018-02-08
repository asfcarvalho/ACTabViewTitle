//
//  UIView+Title+Right+Second.swift
//  Oncoclinicas
//
//  Created by E-Deploy on 20/10/17.
//  Copyright © 2017 asfCarvalho. All rights reserved.
//

import UIKit

@IBDesignable
open class UIViewTitleRightSecond: UIViewTitleRight {
    fileprivate var imgRightSecond: UIImage?
    fileprivate var imgRightSecondWidth: Int?
    fileprivate var imgRightSecondHeigth: Int?
    fileprivate var rightSecontAlert: Int?

    
    @IBInspectable var imageRightSecond: UIImage? {
        didSet{
            self.imgRightSecond = imageRightSecond
            setupView()
        }
    }
    
    @IBInspectable var imageRightSecondWidth: Int {
        set{
            self.imgRightSecondWidth = newValue
            setupView()
        }
        get{
            return self.imgRightSecondWidth ?? 20
        }
    }
    
    @IBInspectable var imageRightSecondHeigth: Int {
        set{
            self.imgRightSecondHeigth = newValue
            setupView()
        }
        get{
            return self.imgRightSecondHeigth ?? 20
        }
    }
    
    @IBInspectable var rightImgSecondPosition: Int {
        set{
            self.rightSecondPosition = newValue
            setupView()
        }
        get{
            return self.rightSecondPosition ?? 8
        }
    }
    
    @IBAction func buttonRightSecondTapped(_ sender: UIButton) {
        self.delegate?.btnRightSecondAction!(sender: sender)
    }
    
    override func setupView() {
        
        super.setupView()
        
        if btnRigthSecond != nil {
            btnRigthSecond?.removeFromSuperview()
        }
        
        let yHeigth = Int((self.frameTemp?.height ?? 0) / 2)
        let y = yHeigth - Int((imgRightSecondHeigth ?? 20) / 2)
        let imgWidth = (imgRightSecondWidth ?? 20)
        
        xRigthSecond = xRigth - imgWidth - (rightSecondPosition ?? 8) //- (xRigth)
        
        btnRigthSecond = UIButton(frame: CGRect(x: xRigthSecond ?? xRigth, y: y, width: imgRightSecondWidth ?? 20, height: imgRightSecondHeigth ?? 20))
        
        if imgRightSecond != nil {
            btnRigthSecond?.setImage(imgRightSecond, for: .normal)
            btnRigthSecond?.addTarget(self, action: #selector(buttonRightSecondTapped(_:)), for: .touchUpInside)
            
            lblNotification = UILabel(frame: CGRect(x: Int((xRigthSecond ?? xRigth) + 25), y: y + 5, width: 15, height: 15))
            lblNotification?.backgroundColor = UIColor.red
            lblNotification?.textColor = UIColor.white
            lblNotification?.textAlignment = .center
            lblNotification?.font = UIFont.boldSystemFont(ofSize: 9)
            lblNotification?.isHidden = true
            lblNotification?.cirecle()
            
            self.addSubview(btnRigthSecond ?? UIButton())
            self.addSubview(lblNotification ?? UILabel())
        }else{
            xRigthSecond = nil
        }
        
    }
}
