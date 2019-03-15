//
//  OutgoingTextCell.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 10/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//

import UIKit

class OutgoingTextCell: UICollectionViewCell {

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
        self.time.roundCorners(corners: .topLeft, radius: 10)
    }
}
