//
//  FoodItemViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-30.
//

import UIKit
import Kingfisher

class FoodItemViewController: UIViewController {

    @IBOutlet weak var Pricelbl: UILabel!
    
    @IBOutlet weak var FoodDescription: UILabel!
    
    @IBOutlet weak var foodNamelbl: UILabel!
    
    @IBOutlet weak var imageFood: UIImageView!
    
    var foodItem: FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = self.foodItem{
            imageFood.kf.setImage(with: URL(string: item.foodImage))
            foodNamelbl.text = item.foodName
            FoodDescription.text = item.foodDescription
            Pricelbl.text = "LKR: \(item.foodPrice)"
        }

    }
    
    @IBAction func BackBtnTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
