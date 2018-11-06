//
//  MainViewController.swift
//  App-Pet
//
//  Created by Lucas Marques Bighi on 22/10/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit
import Firebase

var pets = ["Jorginho", "Marley"]
var myIndex = 0

var refUsuarios: DatabaseReference!
var refPets: DatabaseReference!

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Firebase
        refPets = Database.database().reference().child("pets")
        
        //Side Menu
        sideMenuViewController = storyboard!.instantiateViewController(withIdentifier: "sideMenu") as! SideMenuViewController
        sideMenuViewController.view.frame = UIScreen.main.bounds
        
    }
        
    var sideMenuViewController = SideMenuViewController()
    var isMenuOpened:Bool = false
    
    @IBAction func openMenu(_ sender: Any) {
        if isMenuOpened {
            isMenuOpened = false
            sideMenuViewController.willMove(toParent: nil)
            sideMenuViewController.view.removeFromSuperview()
            sideMenuViewController.removeFromParent()
            //Animation
            /*let transition = CATransition()
            let withDuration = 0.5
            transition.duration = withDuration
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            sideMenuViewController.view.layer.add(transition, forKey: kCATransition)*/
        } else {
            isMenuOpened = true
            self.addChild(sideMenuViewController)
            self.view.addSubview(sideMenuViewController.view)
            sideMenuViewController.didMove(toParent: self)
            //Animation
            /*let transition = CATransition()
            let withDuration = 0.5
            transition.duration = withDuration
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            sideMenuViewController.view.layer.add(transition, forKey: kCATransition)*/
        }
        //Animation
        let transition = CATransition()
        let withDuration = 0.5
        transition.duration = withDuration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        sideMenuViewController.view.layer.add(transition, forKey: kCATransition)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pets.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainViewControllerTableViewCell
        
        cell.imgPet.image = UIImage(named: pets[indexPath.row]+".jpg")
        cell.lblDesc.text = pets[indexPath.row]
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         myIndex = indexPath.row
        performSegue(withIdentifier: "myPetSegue", sender: self)
    }
}

