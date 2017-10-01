//
//  AboutUsCell.swift
//  DND
//
//  Created by Milos Hovjecki on 10/1/17.
//  Copyright © 2017 Milos Hovjecki. All rights reserved.
//

import UIKit

class AboutUsCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var aboutUsImage: UIImageView!
    @IBOutlet weak var aboutUsTitleLbl: UILabel!
    @IBOutlet weak var aboutUsSubtitleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
