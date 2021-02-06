//
//  ShoppingListViewIO.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 14.01.2021.
//

import Foundation

protocol ShoppingListViewInput: class {
    func updateView()
}

protocol ShoppingListViewOutput {
    var products: [Product] { get }
    func removeAllPurchases()
    func listToText() -> String
}
