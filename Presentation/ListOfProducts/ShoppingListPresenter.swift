//
//  ListPresenter.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 12.01.2021.
//

import Foundation

class ShoppingListPresenter: ShoppingListViewOutput {
    let productService: ProductService = ProductServiceImp.shared
    weak var view: ShoppingListViewInput!
    
    var products: [Product] {
        return productService.products
    }
    
    init(view: ShoppingListViewInput) {
        self.view = view
    }
    
    func removeAllPurchases() {
        do {
            try productService.clearAllProducts()
        } catch {
            print(error.localizedDescription)
        }
        view.updateView()
    }
    
    func listToText() -> String {
        var text = ""
        for i in 0..<productService.products.count {
            text += "\(i + 1)) " + productService.products[i].name + ": " + productService.products[i].count.description + "\n"
        }
        return text
    }
}
