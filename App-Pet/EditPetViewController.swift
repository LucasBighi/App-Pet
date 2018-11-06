//
//  EditPetViewController.swift
//  App-Pet
//
//  Created by Lucas Marques Bighi on 24/10/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit
import Firebase

class EditPetViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imgPet: UIImageView!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtSobrenome: UITextField!
    @IBOutlet weak var txtApelido: UITextField!
    @IBOutlet weak var txtRaca: UITextField!
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtDataNasc: UITextField!
    @IBOutlet weak var txtRa: UITextField!
    @IBOutlet weak var txtPai: UITextField!
    @IBOutlet weak var txtMae: UITextField!
    
    var imagemPet: String!
    
    var refPets: DatabaseReference!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func trocaImagem(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgPet.contentMode = .scaleAspectFit
        imgPet.image = chosenImage
        dismiss(animated: true)
    }
    
    @IBAction func salvar(_ sender: Any) {
        addPet()
    }
    
    @IBAction func cancelar(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refPets = Database.database().reference()
        
        imagePicker.delegate = self
        
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "pt")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(EditPetViewController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        txtDataNasc.inputView = datePicker
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(EditPetViewController.dismissPicker))
        txtDataNasc.inputAccessoryView = toolBar
        
        //TextFields
        
    }
    
    func addPet(){
        let id = refPets.childByAutoId().key
        
        let pet = ["id":id,
                   "imagem":imagemPet,
                   "nome":txtNome.text! as String,
                   "sobrenome":txtSobrenome.text! as String,
                   "apelido":txtApelido.text! as String,
                   "dataNasc":txtDataNasc.text! as String,
                   "peso":txtPeso.text! as String,
                   "raca":txtRaca.text! as String,
                   "ra":txtRa.text! as String,
                   "pai":txtPai.text! as String,
                   "mae":txtMae.text! as String
        ]
        
        refPets.child(id!).setValue(pet)
        print("Pet adicionado")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -200, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -200, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    @objc func dismissPicker(){
        view.endEditing(true)
    }

    @objc func datePickerValueChanged(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        let strDate = formatter.string(from: NSDate() as Date)
        formatter.timeStyle = DateFormatter.Style.medium
        txtDataNasc.text = strDate
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red:0.00, green:0.59, blue:1.00, alpha:1.0)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Ok", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
