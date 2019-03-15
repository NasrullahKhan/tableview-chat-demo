//
//  PaddingLabel.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 11/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//


import UIKit

@IBDesignable public class PaddingLabel: UILabel {
    
    @IBInspectable public var topInset: CGFloat = 8.0
    @IBInspectable public var bottomInset: CGFloat = 8.0
    @IBInspectable public var leftInset: CGFloat = 8.0
    @IBInspectable public var rightInset: CGFloat = 8.0
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    override public func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override public var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
