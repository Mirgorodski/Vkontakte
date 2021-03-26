//
//  LoginFormController.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 21.12.2020.
//

import UIKit

class LoginFormController: UIViewController {

    struct Credentials {
        var email: String?
        var password: String?
    }
    
    var credentials = Credentials(email: "", password: "")
    
    @IBOutlet weak var scrollPage: UIScrollView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = UserSession.instance
        currentUser.name = "User Name"
        currentUser.id = 555
        currentUser.token = "Token"
        
    }
    
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        let checkresult = checkUserData()
//        if !checkresult {
//            showLoginError()
//        }
//        return checkresult
//    }
//
//    func checkUserData() -> Bool {
//        guard let email = emailField.text, let password = passwordField.text else { return false }
//        if email == credentials.email && password == credentials.password {
//            return true
//        } else { return false }
//    }
    
    func showLoginError() {
        let alter = UIAlertController(title: "Error", message: "Input credential are incorrect", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
    func credentialsValidation() {
        if emailField.text == credentials.email && passwordField.text == credentials.password {
            performSegue(withIdentifier: "start_navi", sender: self)
        } else {
            showLoginError()
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        credentialsValidation()
    }
    
    
    @IBAction func registrationButton(_ sender: UIButton) {
    }
    
    
    @IBAction func unwindFromRegistrationForm(unwindSegue: UIStoryboardSegue) {
        guard let previousViewController = unwindSegue.source as? RegistrationViewController else { return }
        
        guard previousViewController.email != nil,
              previousViewController.password != nil else { return }
        
        credentials.email = previousViewController.email
        credentials.password = previousViewController.password
        print("sadfasdfasdfasfasdfasdfasf")
        print(credentials)
    }
    

}
