//
//  TableViewCell.swift
//  MessagingApp
//
//  Created by Apple on 07/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var messageCellView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageCellView.layer.cornerRadius = messageLabel.frame.size.height/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
