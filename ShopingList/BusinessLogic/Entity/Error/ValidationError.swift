//
//  ValidationError.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 18.01.2021.
//

import Foundation

enum ValidationError: LocalizedError {
    case emptyField
    case wrongCount
}
