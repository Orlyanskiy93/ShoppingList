//
//  AddPresenter.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 12.01.2021.
//

import Foundation

class AddPresenter: AddViewOutput {
    weak var view: AddViewInput?
    let productService: ProductService = ProductServiceImp.shared
    
    init(view: AddViewInput) {
        self.view = view
    }
    
    func save(product: Product) {
        do {
            try product.validate()
            try productService.save(product: product)
            view?.popView()
        } catch {
            view?.show(error: error)
        }
    }
}
