//
//  UIView+Extension.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 12/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

