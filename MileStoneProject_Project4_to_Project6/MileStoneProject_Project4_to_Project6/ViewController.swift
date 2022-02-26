//
//  ViewController.swift
//  MileStoneProject_Project4_to_Project6
//
//  Created by Peter on 2022/02/26.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeItems))
        navigationItem.title = "Shopping List"
        
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarItems = [spacer, share]
        navigationController?.isToolbarHidden = false
    }
    
    @objc func share(){
        let shoppingListString = shoppingList.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: [shoppingListString], applicationActivities: nil)
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    @objc func addItem(){
        let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let action = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let item = ac?.textFields?[0].text else { return }
            
            self?.submit(item)
        }
        
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    
    @objc func removeItems(){
        shoppingList.removeAll()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    func submit(_ item: String){
        shoppingList.insert(item, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

}

