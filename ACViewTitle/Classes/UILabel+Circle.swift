//
//  UILabel+Circle.swift
//  Oncoclinicas
//
//  Created by Anderson Carvalho on 18/01/18.
//  Copyright © 2018 asfCarvalho. All rights reserved.
//

extension UILabel {
    func cirecle() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true;
    }
}
