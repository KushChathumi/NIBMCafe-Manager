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
    var selectedFoodItem: FoodItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TableViewCell register with the tableView
        TableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCellReuseIdentifier")
        ref = Database.database().reference()
        getFoodItemData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToViewFoodItem"{
            let destinationVC =  segue.destination as! FoodItemViewController
            destinationVC.foodItem = selectedFoodItem
        }
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
                            print(snapshot.value)
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
    // call to the FoodItemViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFoodItem = foodItem[indexPath.row]
        self.performSegue(withIdentifier: "HomeToViewFoodItem", sender: nil)
    }
}
    

