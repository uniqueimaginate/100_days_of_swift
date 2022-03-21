//
//  ViewController.swift
//  MileStoneProject_Project13_to_Project15
//
//  Created by Peter on 2022/03/13.
//

import UIKit

class ViewController: UITableViewController {

    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "country", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped){
                
                do {
                    let data = try JSONDecoder().decode([Country].self, from: jsonData)
                    countries = data

                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        navigationController?.navigationBar.topItem?.title = "Countries"
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = countries[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailTableViewController {
            vc.country = countries[indexPath.row]
            
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

