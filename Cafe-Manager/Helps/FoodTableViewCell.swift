//
//  FoodTableViewCell.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-23.
//

import UIKit
import FirebaseStorage 
import Kingfisher

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var FoodName: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var Price: UILabel!
    
    @IBOutlet weak var viewContainerDiscount: UIView!
    
    @IBOutlet weak var lblDiscount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupView(foodItem: FoodItem)
    {
        FoodName.text = foodItem.foodName
        Description.text = foodItem.foodDescription
        Price.text = "Rs." + String(foodItem.foodPrice)
        if foodItem.foodDiscount > 0 {
            viewContainerDiscount.isHidden = false
            lblDiscount.text = String(foodItem.foodDiscount)+"% OFF"
        } else {
            viewContainerDiscount.isHidden = true
            lblDiscount.text = ""
        }
        imgFood.kf.setImage(with: URL(string: foodItem.foodImage))
    }
}
