//
//  TableViewCell.swift
//  VIPERtest
//
//  Created by Andres Felipe Ocampo Eljaiesk on 18/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, ReuseIdentifier {
    
    
    @IBOutlet weak var myLabelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
