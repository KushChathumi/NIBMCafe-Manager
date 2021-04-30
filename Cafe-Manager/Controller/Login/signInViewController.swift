//
//  signInViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-11.
//

import UIKit
import Firebase
import FirebaseAuth
import Loaf

class signInViewController: UIViewController {
    
    
    @IBOutlet weak var EmailtextFiled: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {

        Auth.auth().signIn(withEmail: EmailtextFiled.text ?? "", password: PasswordTextField.text ?? "") { [self] (result, error) in
            if error != nil{
                if EmailtextFiled.text == ""
                {
                    Loaf("Please Enter Email Address", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
                }
                if PasswordTextField.text == ""{
                    Loaf("Please Enter Password", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
                }
                else
                {
                print(error?.localizedDescription as Any)
                Loaf("User Name or Password is invalid...!", state: .error, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
                }
            }
            else{
                
                if let email = result?.user.email{
                    self.getUserData(email: email)
                }else{
                    Loaf("user Email not found", state: .error, sender: self).show()
                }
        
                let HomeTabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeTabViewController) as? HomeTabBarController
                self.view.window?.rootViewController = HomeTabBarController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    func getUserData(email: String){
        ref.child("users").child(email.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")).observe(.value, with: {
            (snapshot) in
         if snapshot.hasChildren(){
            if let data = snapshot.value{
                if let userData = data as? [String: String]{
                    //to access user data
                    let user = User(
                        userName: userData["userName"]!,
                        userEmail: userData["userEmail"]!,
                        userPassword: userData["userPassword"]!,
                        userPhone: userData["userPhone"]!)
                    print(userData)
                    //SAVE USER LOGGED STATE
                    let sessionManager = sessionMange()
                    sessionManager.saveUserLogin(user: user)
                    //self.performSegue(withIdentifier: "SignInToHome", sender: nil)
                }
            }
                
         }else
         {
            Loaf("user not found", state: .error, sender: self).show()
         }
                
       })
    }
}

