//
//  RefeicaoViewController.swift
//  App-Pet
//
//  Created by Lucas Marques Bighi on 01/11/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit

var horario = ["12:00", "19:00"]
var etiqueta = ["Almoco", "Janta"]
var ativado = [true, false]

var refeicoesIndex = Int()

class RefeicaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horario.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let refeicaoCell = tableView.dequeueReusableCell(withIdentifier: "refeicaoCell", for: indexPath) as! RefeicaoTableViewCell
        
        refeicaoCell.lblHora.text = horario[indexPath.row]
        refeicaoCell.lblEtiqueta.text = etiqueta[indexPath.row]
        refeicaoCell.stcRefeicao.isOn = ativado[indexPath.row]
        
        return(refeicaoCell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //refeicoesIndex = indexPath.row
        //performSegue(withIdentifier: "refeicaoSegue", sender: self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rvc = storyboard.instantiateViewController(withIdentifier: "editRefeicao") as! EditRefeicaoViewController
        
        rvc.getEtiqueta = etiqueta[indexPath.row]
        
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "refeicaoSegue"{
            //let vc = segue.destination as! EditRefeicaoViewController
            
        }
    }

}
