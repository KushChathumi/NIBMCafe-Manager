//
//  EntityModel.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-23.
//

import Foundation

struct User {
    var userName:String
    var userEmail: String
    var userPassword: String
    var userPhone: String
    
}

struct FoodItem {
    var _id: String
    var foodName: String
    var foodDescription: String
    var foodPrice: Double
    var foodDiscount: Int
    var foodImage: String
    var category: String
}

struct Order {
    var orderID: String
    var orderStatus: String
    var orderTotal: Double
}

struct Category {
    var categoryName: String
}
