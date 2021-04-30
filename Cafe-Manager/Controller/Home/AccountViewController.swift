//
//  AccountViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-30.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var Logout: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LogoutTapped(_ sender: Any) {
        let sessionManager = sessionMange()
        sessionManager.getLoggedStatus()
       // dismiss(animated: false, completion: nil)
    }
}
