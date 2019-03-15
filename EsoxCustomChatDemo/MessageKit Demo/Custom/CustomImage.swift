//
//  CustomImage.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 11/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//

import UIKit

@IBDesignable
class CustomImage: UIImageView {
    
    @IBInspectable var cornerRadius : CGFloat = 0.0{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    @IBInspectable var borderWidth : Double = 0{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    @IBInspectable var circular : Bool = false{
        didSet{
            self.applyCornerRadius()
        }
    }
    
    func applyCornerRadius()
    {
        if(self.circular) {
            self.layer.cornerRadius = self.bounds.size.height/2
            self.layer.masksToBounds = true
            self.layer.borderColor = self.borderColor.cgColor
            self.layer.borderWidth = CGFloat(self.borderWidth)
            self.clipsToBounds = true
            self.layer.cornerRadius = 6
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }else {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
            self.layer.borderColor = self.borderColor.cgColor
            self.layer.borderWidth = CGFloat(self.borderWidth)
            self.clipsToBounds = true
            self.layer.cornerRadius = 6
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyCornerRadius()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadius()
    }
    
}
