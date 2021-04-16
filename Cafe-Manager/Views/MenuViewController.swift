//
//  MenuViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-16.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var MsgLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Switch(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            MsgLable.text = "Print"
        }
        else
        {
            MsgLable.text = "Don't Print"
        }
    }

    
    @IBAction func AddButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func CategoryTapped(_ sender: Any) {
    }
}
