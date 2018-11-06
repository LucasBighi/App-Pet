//
//  MyPetViewController.swift
//  App-Pet
//
//  Created by Lucas Marques Bighi on 24/10/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit

class MyPetViewController: UIViewController {

    
    @IBOutlet weak var imgPet: UIImageView!
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblApelido: UILabel!
    @IBOutlet weak var lblPeso: UILabel!
    @IBOutlet weak var lblDataNasc: UILabel!
    @IBOutlet weak var lblIdade: UILabel!
    @IBOutlet weak var lblNomePai: UILabel!
    @IBOutlet weak var lblNomeMae: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNome.text = pets[myIndex]
        imgPet.image = UIImage(named: pets[myIndex]+".jpg")
        imgPet.layer.cornerRadius = 10
        
    }

}

extension UIImageView
{
    func roundCornersForAspectFit(radius: CGFloat)
    {
        if let image = self.image {
            
            //calculate drawingRect
            let boundsScale = self.bounds.size.width / self.bounds.size.height
            let imageScale = image.size.width / image.size.height
            
            var drawingRect: CGRect = self.bounds
            
            if boundsScale > imageScale {
                drawingRect.size.width =  drawingRect.size.height * imageScale
                drawingRect.origin.x = (self.bounds.size.width - drawingRect.size.width) / 2
            } else {
                drawingRect.size.height = drawingRect.size.width / imageScale
                drawingRect.origin.y = (self.bounds.size.height - drawingRect.size.height) / 2
            }
            let path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
