//
//  EditViewController.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 09.12.2020.
//

import UIKit

class EditViewController: UIViewController, EditViewInput {
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var steper: UIStepper!
    var oldProduct: Product!
    var output: EditViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = EditPresenter(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        editTextField.text = oldProduct?.name
        steper.minimumValue = 1
        navigationItem.title = "Edit"
        if let count = oldProduct?.count {
            countLabel.text = String(count)
            steper.value = Double(count)
        }
    }
    
    func popView() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func countChange(_ sender: UIStepper) {
        countLabel.text = String(Int(steper.value))
    }
    
    @IBAction func save(_ sender: UIButton) {
        let newProductName = editTextField.text ?? ""
        let newProductCount = Int(steper.value)
        let newProduct = Product(name: newProductName, count: newProductCount)
        output.save(oldProduct: oldProduct, newProduct: newProduct)
    }

}
