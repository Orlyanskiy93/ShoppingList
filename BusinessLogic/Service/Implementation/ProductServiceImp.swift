//
//  PurchasesBank.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 11.12.2020.
//

import UIKit
import CoreData

class ProductServiceImp: ProductService {
    private var appDelegate: AppDelegate!
    private var context: NSManagedObjectContext!
    
    private var productData = [ProductData]()
    var products = [Product]()
    
    static let shared = ProductServiceImp()
    private init() {
        do {
            try productData = fetchProducts()
        } catch {
            print(error.localizedDescription)
        }
        products = map(purchaseDataArray: productData)
    }
    
    private func fetchProducts() throws -> [ProductData] {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate.persistentContainer.viewContext
        do {
            return try context.fetch(ProductData.fetchRequest()) as [ProductData]
        } catch {
            throw DataError.fetchError
        }
    }
    
    func map(purchaseDataArray: [ProductData]) -> [Product] {
        var products: [Product] = []
        for i in 0..<purchaseDataArray.count {
            let item = purchaseDataArray[i].name ?? ""
            let count = Int(purchaseDataArray[i].count)
            let product = Product(name: item, count: count)
            products.append(product)
        }
        return products
    }
    
    func save(_ product: Product) throws {
        products.append(product)
        let newProduct = ProductData(context: context)
        newProduct.count = Int16(product.count)
        newProduct.name = product.name
        productData.append(newProduct)
        do {
            try context.save()
        } catch {
            throw DataError.saveError
        }
    }
    
    func editProduct(_ oldProduct: Product, _ newProduct: Product) throws {
        var dataIndex = 0
        var productIndex = 0
        
        for i in 0..<productData.count {
            if productData[i].name == oldProduct.name {
                dataIndex = i
            }
            if products[i].name == oldProduct.name {
                productIndex = i
            }
        }
        productData[dataIndex].name = newProduct.name
        productData[dataIndex].count = Int16(newProduct.count)
        products[productIndex] = newProduct
        
        do {
            try context.save()
        } catch {
            throw DataError.editError
        }
    }
    
    func clearAllProducts() throws {
        products.removeAll()
        for i in 0..<productData.count {
            context.delete(productData[i])
        }
        do {
            try context.save()
        } catch {
            throw DataError.clearError
        }
    }
}
