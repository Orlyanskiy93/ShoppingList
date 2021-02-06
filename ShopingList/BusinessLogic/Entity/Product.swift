//
//   Purchases.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 07.12.2020.
//

import Foundation

struct Product {
    var name: String
    var count: Int
    
    func validate() throws {
        if name == "" {
            throw ValidationError.emptyField
        }
        if count < 1 {
            throw ValidationError.wrongCount
        }
    }
}
