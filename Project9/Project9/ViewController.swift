//
//  ViewController.swift
//  Project7
//
//  Created by Peter on 2022/02/27.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(alert))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterPetitions))
    }
    
    @objc func fetchJSON(){
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
                
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                self.parse(json: data)
                return
            }
        }
        
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    @objc func alert(){
        let ac = UIAlertController(title: "Credit", message: "Data is coming from \'We The People API of the Whitehouse\'", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    
    @objc func filterPetitions(){
        let ac = UIAlertController(title: "Searh Keywords", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let action = UIAlertAction(title: "Confirm", style: .default) { [weak self, weak ac] _ in
            guard let searchText = ac?.textFields?[0].text else { return }
            guard let self = self else { return }
            
            if searchText.isEmpty {
                return
            }
            
            self.filteredPetitions = self.petitions.filter { $0.title.lowercased().contains(searchText) }
            self.tableView.reloadData()
            
        }
        ac.addAction(action)
        
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    
    @objc func showError() {
        
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
    }
}

