//
//  UIViewInput.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 18.01.2021.
//

import UIKit

protocol UIViewInput {
    func show(title: String?, message: String?)
    func show(_ error: Error)
}

extension UIViewInput {
    func show(_ error: Error) {
        show(title: "Error", message: error.localizedDescription)
    }
    
    func show(title: String?, message: String?) {
        guard let vc = self as? UIViewController else { return }
        let allert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        allert.addAction(action)
        vc.present(allert, animated: true, completion: nil)
    }
}
