//
//  MainViewControllerTableViewCell.swift
//  App-Pet
//
//  Created by Lucas Marques Bighi on 22/10/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit

class MainViewControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPet: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblAniversario: UILabel!
    @IBOutlet weak var lblIdade: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
