//
//  ShoppingListCell.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 08.12.2020.
//

import UIKit

class ShoppingListCell: UITableViewCell {
    static let identifier = "ShoppingListCell"
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func fillShoppingListCell(with purchase: Product) {
        itemLabel.text = purchase.name
        countLabel.text = String(purchase.count)
    }
}
