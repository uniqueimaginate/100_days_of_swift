//
//  DetailTableViewController.swift
//  MileStoneProject_Project13_to_Project15
//
//  Created by Peter on 2022/03/13.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var country: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        guard let country = country else {
            return UITableViewCell()
        }

        
        cell.textLabel?.text = """
            Name: \(country.name)
            Capital: \(country.capitalCity)
            Population: \(country.population)
            Currency: \(country.currency)
            """
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }



}
