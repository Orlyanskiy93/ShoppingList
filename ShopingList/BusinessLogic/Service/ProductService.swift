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
    func editProduct(oldProduct: Product, newProduct: Product) throws
    func save(product: Product) throws
}
