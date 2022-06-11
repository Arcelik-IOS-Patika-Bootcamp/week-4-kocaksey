//
//  TableViewCell.swift
//  week_4_seyhunkocak
//
//  Created by Seyhun Koçak on 11.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var coinSymbolView: UIImageView!
    @IBOutlet weak var coinValueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
