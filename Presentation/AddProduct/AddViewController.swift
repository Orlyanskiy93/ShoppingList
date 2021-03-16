//
//  AddViewController.swift
//  ShoppingList
//
//  Created by Дмитрий Орлянский on 09.12.2020.
//

import UIKit

class AddViewController: UIViewController, AddViewInput {
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countSteper: UIStepper!
    var output: AddViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = AddPresenter(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        countSteper.minimumValue = 1
        countSteper.value = 1
        countLabel.text = Int(countSteper.value).description
        navigationItem.title = "Add"
    }
    
    @IBAction func countChange(by steper: UIStepper) {
        countLabel.text = Int(countSteper.value).description
    }
    
    func popView() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func add(_ sender: Any) {
        let name = addTextField.text ?? ""
        let count = Int(countSteper.value)
        let product = Product(name: name, count: count)
        output.save(product: product)
    }
}
