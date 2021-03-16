//
//  EditViewIO.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 15.01.2021.
//

import Foundation

protocol EditViewInput: class, UIViewInput {
    func setupInitialState()
    func popView()
}

protocol EditViewOutput {
    func save(oldProduct: Product, newProduct: Product)
    func viewIsReady()
}
