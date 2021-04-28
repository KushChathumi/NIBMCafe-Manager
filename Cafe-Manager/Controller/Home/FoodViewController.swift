//
//  FoodViewController.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-23.
//

import UIKit
import FirebaseDatabase

class FoodViewController: UIViewController {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    var ref: DatabaseReference!
    
    var foodItem: [FoodItem] = []
    
//        var foodItem: [FoodItem] = [FoodItem(_id: "001", foodName: "cheese Burgur", foodDescription: "Cheese burgur", foodPrice: 650, foodDiscount: 10, foodImage: "img_55e65939b75ea"),
//            FoodItem(_id: "002", foodName: "Burgur", foodDescription: "Burgur", foodPrice: 600, foodDiscount: 0, foodImage: "img_55e65939b75ea")
//        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TableViewCell register with the tableView
        TableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCellReuseIdentifier")
        ref = Database.database().reference()
        getFoodItemData()
    }
}

extension FoodViewController{
    func getFoodItemData(){
        ref.child("foodNames").observe(.value, with: {
            (snapshot) in
            
            if let data = snapshot.value{
                // String = key in databse
                if let foodItems = data as? [String: Any]
                {
                    // Use for print value as loop
                    for item in foodItems {
                        if let foodInfo = item.value as? [String: Any]{
                            let singleFoodItem = FoodItem(
                                _id: "",
                                foodName: (foodInfo["foodName"] as! String),
                                foodDescription: foodInfo["Description "] as! String,
                                foodPrice: foodInfo["Price"] as! Double,
                                foodDiscount: foodInfo["Discount"] as! Int,
                                foodImage: foodInfo["foodName"] as! String,
                                category: foodInfo["category"]as! String)
                            
                            self.foodItem.append(singleFoodItem)
                            
                            //print("=========Food Shop=========")
                            //print("Food Name : \(foodInfo["foodName"] as! String)")
                            //print("Food Price : \(foodInfo["Price"] as! Double)")
                            //print(foodInfo)
                        }
                    }
                    self.TableView.reloadData()
                }
            }
        })
    }
}

extension FoodViewController :UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier:"FoodCellReuseIdentifier", for: indexPath) as! FoodTableViewCell
        cell.setupView(foodItem: foodItem[indexPath.row])
        return cell
    }
}
    

