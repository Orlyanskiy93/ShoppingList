//
//  ProductService.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 14.01.2021.
//

import Foundation

protocol ProductService {
    var products: [Product] { get }
    
    func clearAllProducts() throws
    func editProduct(_ oldProduct: Product, _ newProduct: Product) throws
    func save(_ product: Product) throws
}
