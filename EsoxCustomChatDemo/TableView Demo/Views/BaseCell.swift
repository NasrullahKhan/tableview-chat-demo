//
//  BaseCell.swift
//  EsoxCustomChatDemo
//
//  Created by Nasrullah Khan  on 14/03/2019.
//  Copyright © 2019 Nasrullah Khan . All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var photo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        separatorInset = UIEdgeInsets.zero
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsets.zero
        layoutIfNeeded()
        
        // Set the selection style to None.
        selectionStyle = UITableViewCell.SelectionStyle.none
                
        if self.isKind(of: OutgoingTextTVC.self) || self.isKind(of: OutgoingPhotoTVC.self) {
        // time label top left corner radius
        self.time.roundCorners(corners: .topLeft, radius: 10)
        }else {
            self.time.roundCorners(corners: .topRight, radius: 10)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
