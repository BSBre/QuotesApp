//
//  SearchControllerTableViewCell.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/11/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import UIKit

class SearchControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImgImageView: UIImageView!
    @IBOutlet weak var desctriptionLabel: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
