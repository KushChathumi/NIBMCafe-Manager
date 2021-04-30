//
//  CategoryTableViewCell.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-30.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var CatName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func DeleteTapped(_ sender: Any) {
    }
    
    func  setUpUI(catgory: Category) {
        CatName.text = catgory.categoryName
    }
}
