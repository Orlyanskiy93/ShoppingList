//
//  AddViewIO.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 16.01.2021.
//

import Foundation

protocol AddViewInput: class, UIViewInput {
    func setupInitialState()
    func popView()
}

protocol AddViewOutput {
    func save(product: Product)
    func viewIsReady()
}
