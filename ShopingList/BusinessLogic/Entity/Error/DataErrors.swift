//
//  Error.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 16.01.2021.
//

import Foundation

enum DataError: LocalizedError {
    case saveError
    case editError
    case clearError
    case fetchError
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return "Can't save data"
        case .editError:
            return "Can't save data after editing product"
        case .clearError:
            return "Can't save data after clear products"
        case .fetchError:
            return "Can't fetch data"
        }
    }
}
