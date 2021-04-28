//
//  signInViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-11.
//

import UIKit
import FirebaseAuth
import Loaf

class signInViewController: UIViewController {
    
    
    @IBOutlet weak var EmailtextFiled: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    //@IBOutlet weak var LoginButton: UIButton!
    
   // @IBOutlet weak var ErrorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //func setUpElements() {
        //ErrorLable.alpha=0}

    
    @IBAction func signInTapped(_ sender: Any) {
        
        let email = EmailtextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                //self.ErrorLable.text = error?.localizedDescription
                //self.ErrorLable.alpha = 1
                Loaf("User Name or Password is invalid...!", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            }
            else{
                let HomeTabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeTabViewController) as? HomeTabBarController
                
                self.view.window?.rootViewController = HomeTabBarController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}
