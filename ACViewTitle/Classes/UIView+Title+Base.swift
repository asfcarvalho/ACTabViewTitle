//
//  UIView+Title+Base.swift
//  Oncoclinicas
//
//  Created by Anderson Carvalho on 19/10/17.
//  Copyright © 2017 asfCarvalho. All rights reserved.
//

import UIKit

@IBDesignable
open class UIViewTitleBase: UIView {

    weak open var delegate : UIViewTitleDelegate?
    @IBOutlet var btnLeft: UIButton?
    @IBOutlet var btnRigth: UIButton?
    @IBOutlet var btnRigthSecond: UIButton?
    @IBOutlet var lblNotification: UILabel?
    @IBOutlet var lblTitleMenu: UILabel?
    
    var rightPosition: Int?
    var rightSecondPosition: Int?
    var xRigth: Int = 0
    var xRigthSecond: Int?
    var notificationValue: Int = 0
    
    var frameTemp: CGRect?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        frameTemp = CGRect(x: frame.minX, y: frame.minY, width: UIScreen.main.bounds.size.width, height: frame.height)
        
        self.updateConstraints()
        self.layoutIfNeeded()
    }
    
    func setNotification(value: Int) {
        self.notificationValue = value
        self.lblNotification?.text = String(describing: self.notificationValue)
        self.lblNotification?.isHidden = (self.notificationValue <= 0)
    }
}

@objc public protocol UIViewTitleDelegate: NSObjectProtocol{
    
    @objc optional func btnLeftAction(sender: UIButton)
    
    @objc optional func btnRightAction(sender: UIButton)
    
    @objc optional func btnRightSecondAction(sender: UIButton)
}
