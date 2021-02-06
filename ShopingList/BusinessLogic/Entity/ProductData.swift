//
//  PurchaseData+CoreDataClass.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 21.12.2020.
//
//

import Foundation
import CoreData

@objc(ProductData)
public class ProductData: NSManagedObject {
    @NSManaged public var name: String?
    @NSManaged public var count: Int16
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductData> {
        return NSFetchRequest<ProductData>(entityName: "ProductData")
    }

}
extension ProductData : Identifiable {

}
