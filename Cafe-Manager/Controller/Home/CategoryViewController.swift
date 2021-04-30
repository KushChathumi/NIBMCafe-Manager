//
//  CategoryViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-16.
//

import UIKit
import Firebase

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryTable: UITableView!
    
    var category: [Category] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTable.register(UINib(nibName: "CategoryViewController", bundle: nil), forCellReuseIdentifier: "CategoryCellReuseIdentifier")
        ref = Database.database().reference()
    }
}
    
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = categoryTable.dequeueReusableCell(withIdentifier:"CategoryCellReuseIdentifier", for: indexPath) as! CategoryTableViewCell
        cell.setUpUI(catgory: category[indexPath.row])
        return cell
    }
}




