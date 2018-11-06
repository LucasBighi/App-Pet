//
//  RefeicaoTableViewCell.swift
//  App-Pet
//
//  Created by Lucas Marques Bighi on 01/11/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit

class RefeicaoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblHora: UILabel!
    @IBOutlet weak var lblEtiqueta: UILabel!
    @IBOutlet weak var stcRefeicao: UISwitch!
    
    @IBAction func btnExcluir(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
