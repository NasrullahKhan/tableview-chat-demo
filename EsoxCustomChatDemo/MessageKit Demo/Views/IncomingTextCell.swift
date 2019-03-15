//
//  IncomingTextCell.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 11/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//

import UIKit

class IncomingTextCell: UICollectionViewCell {
    
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.time.roundCorners(corners: .topRight, radius: 10)
    }
}
