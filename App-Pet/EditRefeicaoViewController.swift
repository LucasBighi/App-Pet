//
//  EditRefeicaoViewController.swift
//  App-Pet
//
//  Created by Lucas Marques Bighi on 01/11/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit

class EditRefeicaoViewController: UIViewController {
    
    @IBOutlet weak var dtpHoraRefeicao: UIDatePicker!
    @IBOutlet weak var txtEtiqueta: UITextField!

    @IBAction func cancelar(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var getEtiqueta = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtEtiqueta.text = getEtiqueta
    }

}
