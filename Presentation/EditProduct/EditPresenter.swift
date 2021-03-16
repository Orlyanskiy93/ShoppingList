//
//  EditPresenter.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 12.01.2021.
//

import Foundation

class EditPresenter: EditViewOutput {
    let productService: ProductService = ProductServiceImp.shared
    weak var view: EditViewInput!
    
    init(view: EditViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func save(oldProduct: Product, newProduct: Product) {
        do {
            try newProduct.validate()
            try productService.editProduct(oldProduct, newProduct)
            view.popView()
        } catch {
            view.show(error)
        }
    }
}
