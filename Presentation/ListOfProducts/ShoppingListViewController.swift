//
//  ViewController.swift
//  ShopingList
//
//  Created by Дмитрий Орлянский on 02.12.2020.
//

import UIKit
import CoreData

class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ShoppingListViewInput {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    var output: ShoppingListViewOutput!
    var indexOfChosenCell = 0
    // 1111

    override func viewDidLoad() {
        super.viewDidLoad()
        output = ShoppingListPresenter(view: self)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        tableView.isHidden = output.products.isEmpty
        tableView.reloadData()
        emptyLabel.isHidden = !output.products.isEmpty
        shareButton.isHidden = output.products.isEmpty
    }
    
    func setupTableView() {
        let nib = UINib(nibName: ShoppingListCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ShoppingListCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListCell.identifier) as! ShoppingListCell
        cell.fillShoppingListCell(with: output.products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexOfChosenCell = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editVC = segue.destination as? EditViewController {
            editVC.oldProduct = output.products[indexOfChosenCell]
        }
    }
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Clear all products?", message: nil , preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) { _ in
            self.output.removeAllPurchases()
        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func share(_ sender: UIButton) {
        let vc = UIActivityViewController(activityItems: [output.listToText()], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }
}

