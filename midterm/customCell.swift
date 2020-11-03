//
//  customCell.swift
//  midterm
//
//  Created by Айдана on 10/16/20.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
