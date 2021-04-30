//
//  LaunchViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-30.
//

import UIKit

class LaunchViewController: UIViewController {

    let sessionMgr = sessionMange()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if sessionMgr.getLoggedStatus(){
            self.performSegue(withIdentifier: "SignInToHome", sender: nil)
        }
        else
        {
            self.performSegue(withIdentifier: "launchToSignIn", sender: nil)
        }
    }
}
