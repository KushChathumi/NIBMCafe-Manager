//
//  OrderTableViewCell.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-30.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderIDLable: UILabel!
    
    @IBOutlet weak var StatusLable: UILabel!
    
    @IBOutlet weak var totalLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  setUpUI(order: Order) {
        orderIDLable.text = order.orderID
        StatusLable.text = order.orderStatus
        totalLable.text = "LKR \(order.orderTotal)"
    }
    
}
