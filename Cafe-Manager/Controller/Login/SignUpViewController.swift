//
//  SignUpViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-11.
//

import UIKit
import Loaf
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var NameTextFiled: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var ContactNumberTextFiled: UITextField!
    @IBOutlet weak var PasswordTextFiled: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    
    
    @IBAction func SignUpTapped(_ sender: UIButton) {
        if validateInput(){
            
            let user = User(userName: NameTextFiled.text ?? "", userEmail: EmailTextField.text ?? "", userPassword: PasswordTextFiled.text ?? "" , userPhone: ContactNumberTextFiled.text ?? "")
            
            RegisterUser(user: user)
            self.saveUserInDB(user: user)
            let HomeTabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeTabViewController) as? HomeTabBarController
            self.view.window?.rootViewController = HomeTabBarController
            self.view.window?.makeKeyAndVisible()
        }
        else{
            print("Errors found")
        }
    }

    @IBAction func SignInButtonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    func RegisterUser(user: User){
        Auth.auth().createUser(withEmail: user.userEmail, password: user.userPassword) { authResult, error in
         if let err =  error
         {
            print(err.localizedDescription)
            Loaf("User sign up failed", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return
         }
            
            if let result = authResult{
                print("User added with email: \(result.user.email ?? "Not Found")")
            }
        }
    }
    
    func validateInput() -> Bool{
        
        guard let name = NameTextFiled.text else {
            Loaf("Name cannot to be blank", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        guard let email = EmailTextField.text else {
            Loaf("Email cannot be blank", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        guard let phone = ContactNumberTextFiled.text else {
            Loaf("Phone Number cannot be blank", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        guard let password = PasswordTextFiled.text else {
            Loaf("Password cannot be blank", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        if name.count < 5{
            Loaf("Invalid Name", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        if email.count < 5{
            Loaf("Invalid Email", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        if phone.count == 11{
            Loaf("Invalid Phone Number", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        if password.count < 5{
            Loaf("Enter valid Password", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            return false
        }
        return true
    }
    
    func saveUserInDB(user: User){
        
        let userData = [
            "userName" : user.userName,
            "userEmail" : user.userEmail,
            "userPhone" : user.userPhone,
            "userPassword": user.userPassword
        ]
        
        //users -> table name in database
        self.ref.child("users").child(user.userEmail.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")).setValue(userData){
            (error, ref) in

            if let err = error{
                print(err.localizedDescription)
                Loaf("User Registered fail...!", state: .error, sender: self).show()
                return
            }
        }
    }
}
