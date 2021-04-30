//
//  MenuViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-16.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Switch(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            print("Set as Item")
        }
        else
        {
            print("Doesn't set as Item")
        }
    }

    
    @IBAction func AddButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func CategoryTapped(_ sender: Any) {
    }
}
