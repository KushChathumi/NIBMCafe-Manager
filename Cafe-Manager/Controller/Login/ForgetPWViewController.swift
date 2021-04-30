//
//  ForgetPWViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-11.
//

import UIKit
import FirebaseAuth
import Loaf

class ForgetPWViewController: UIViewController {

    @IBOutlet weak var EmainTextFiled: UITextField!
    
   // @IBOutlet weak var SendButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        ErrorLabel.alpha=0}
    

    @IBAction func sendButtonTapped(_ sender: Any) {
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: EmainTextFiled.text!) { (error) in
            if let error =  error{
                let alert = Service.createAlertController(title: "Error!", message: error.localizedDescription)
                self.ErrorLabel.text = error.localizedDescription
                self.ErrorLabel.alpha = 1
                return
            }
            else
            {
            let  alert =  Service.createAlertController(title: "Done", message: "A Password reset Email has been sent!")
                
                Loaf(" Password reset Email has been sent!", state: .success, presentingDirection: .left, dismissingDirection: .vertical, sender: self).show()
            //self.ErrorLabel.text = error?.localizedDescription
            //self.ErrorLabel.alpha = 1
            }
        }
    }
    
    @IBAction func BackButtonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}
