//
//  NewItemViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-16.
//

import UIKit

class NewItemViewController: UITabBarController {
    
    @IBOutlet weak var Msglable: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Switch(_ sender: UISwitch) {
        
        if(sender.isOn == true)
        {
            Msglable.text = "Yes. Open it"
        }
        else
        {
            Msglable.text = "No.Doesn't Open"
        }
    }
}
