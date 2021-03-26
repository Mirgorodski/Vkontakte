//
//  RegistrationViewController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 19.01.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        
        if newEmailTextField.text == "" && newPasswordTextField.text != "" {
            headerLabel.textColor = UIColor.red
            headerLabel.text = "Please, enter Email"
        } else if newEmailTextField.text != "" && newPasswordTextField.text == "" {
            headerLabel.textColor = UIColor.red
            headerLabel.text = "Please, enter Password"
        } else if newEmailTextField.text == "" && newPasswordTextField.text == "" {
            headerLabel.textColor = UIColor.red
            headerLabel.text = "Please, enter Email and Password"
        } else {
            
            if newPasswordTextField.text != retypePasswordTextField.text {
                headerLabel.textColor = UIColor.red
                headerLabel.text = "Please, re-type Password correctly"
            } else {
                email = newEmailTextField.text
                password = newPasswordTextField.text
                headerLabel.textColor = UIColor.black
                headerLabel.text = "Credantials successfully saved"
                print(email, password)
            }
        }
        
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
    }
    
}

