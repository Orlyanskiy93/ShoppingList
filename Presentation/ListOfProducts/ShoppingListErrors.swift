//
//  ShoppingListErrors.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 16.01.2021.
//

import Foundation

enum ShoppingListError: LocalizedError {
    case tableViewCellError
    var errorDescription: String? {
        return "Cell error"
    }
}
