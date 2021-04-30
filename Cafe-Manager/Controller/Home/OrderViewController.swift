//
//  OrderViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class OrderViewController: UIViewController {
    
    @IBOutlet weak var OrderTable: UITableView!
    
    var orders: [Order] = []
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrderTable.register(UINib(nibName: "OrderViewController", bundle: nil), forCellReuseIdentifier: "OrderCellReuseIdentifier")
        ref = Database.database().reference()

    }
    
} 

extension OrderViewController{
    func getOrders() {
        
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OrderTable.dequeueReusableCell(withIdentifier:"OrderCellReuseIdentifier", for: indexPath) as! OrderTableViewCell
        cell.setUpUI(order: orders[indexPath.row])
        return cell
    }
    
    
}
