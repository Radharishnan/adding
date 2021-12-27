//
//  ViewController.swift
//  adding
//
//  Created by Ragulmoorthi on 27/12/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var name: UITextField!
    @IBOutlet var ageTextfield: UITextField!
    @IBOutlet var ageStepper: UIStepper!
    @IBOutlet var textFieldGender: UITextField!
    @IBOutlet var switchForGender: UISwitch!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var imageView: UIImageView!
    
    
    
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageStepper.autorepeat = true
        ageStepper.isContinuous = true
        ageTextfield.text = ageStepper.value.description
        ageStepper.maximumValue = 100
        ageStepper.minimumValue = 0
    
        dateFormatter.dateFormat = "MM/dd/yy"
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 300
    }
    
    @IBAction func BackButtonTap() {
      //  let VC1 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //  present(VC1, animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
       // dismiss(animated: true, completion: nil)
    }
    @IBAction func stepperValueChange() {
        ageTextfield.text = ageStepper.value.description
        
    }
    @IBAction func switchValueChange(_sender:UISwitch) {
        if(switchForGender.isOn){
            textFieldGender.text = "Female"
        }
        else {
            textFieldGender.text = "Male"
        }
    }
    @IBAction func datePickerValueChange(_sender: UIDatePicker){
        dateTextField.text = dateFormatter.string(from: _sender.date)
        view.endEditing(true)
    }
    
    @IBAction func sliderValueChange(_sender: UISlider){
        let value = round(_sender.value)
        _sender.value = value
        heightTextField.text = Int(_sender.value).description
    }
    @IBAction func didTapButton(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        present(vc, animated: true)
    }
    @IBAction func buttonPressed() {
        
        let alertController = UIAlertController(title: "Alert", message: "Please Enter all details", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        if name.text?.isEmpty ?? true || ageTextfield.text?.isEmpty ?? true || textFieldGender.text?.isEmpty ?? true || dateTextField.text?.isEmpty ?? true || heightTextField.text?.isEmpty ?? true || imageView.image == nil{
           self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
           
      
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


