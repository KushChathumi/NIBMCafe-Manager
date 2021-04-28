//
//  SignUpViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-11.
//

import UIKit
import Loaf

class SignUpViewController: UIViewController {

    @IBOutlet weak var NameTextFiled: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ContactNumberTextFiled: UITextField!
    @IBOutlet weak var PasswordTextFiled: UITextField!
    //@IBOutlet weak var SignupButton: UIButton!
    //@IBOutlet weak var ErrorLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   // func setUpElements() {
     //   ErrorLable.alpha=0}
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        Service.signUpUser(email: EmailTextField.text!, password: PasswordTextFiled.text!, contact: ContactNumberTextFiled.text!) {
            let HomeTabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeTabViewController) as? HomeTabBarController
            self.view.window?.rootViewController = HomeTabBarController
            Loaf("User create successfully", state: .success, sender: self).show()
            self.view.window?.makeKeyAndVisible()
           
        } onError: { (error) in
            //self.ErrorLable.text = error?.localizedDescription
            //self.ErrorLable.alpha = 1
            
            Loaf("User Signup Fail", state: .error, sender: self).show()
        }

    }

    
    @IBAction func SignInButtonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
