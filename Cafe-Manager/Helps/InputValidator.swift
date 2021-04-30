//
//  InputValidator.swift
//  Cafe-Manager
//
//  Created by Kushani Abeysinghe on 2021-04-29.
//

import Foundation

class InputValidator{
    
    static func isValidEmail(email: String) ->  Bool{
        let email = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" )
        return email.evaluate(with: email)
    }
    
//    func isValidEmail(email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
    
    static func isValidName(name: String) ->  Bool{
        let name = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z ]{2,100}")
        return name.evaluate(with: name)
    }
    
    static func isValidContact(contact: String) ->  Bool{
        let contact = NSPredicate(format: "SELF MATCHES %@", "^(07)(0|1|2|5|6|7|8)[\\d]{7}$")
        return contact.evaluate(with: contact)
    }
    
    static func is_validPassword(pass: String, minLegnth: Int, maxLength: Int) -> Bool{
        return pass.count >= minLegnth && pass.count <= maxLength
    }
}


