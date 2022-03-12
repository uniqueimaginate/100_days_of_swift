//
//  ViewController.swift
//  Project1
//
//  Created by Peter on 2022/02/23.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    var numbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        DispatchQueue.global(qos: .userInteractive).async {
            let items = try! fm.contentsOfDirectory(atPath: path)
            
            for item in items{
                if item.hasPrefix("nssl"){
                    self.pictures.append(item)
                }
            }
            
            if let temp = UserDefaults.standard.object(forKey: "numbers") as? [Int] {
                self.numbers = temp
            } else {
                self.numbers = Array(repeating: 0, count: self.pictures.count)
            }
            
            self.pictures.sort()
        
            DispatchQueue.main.async {
                self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
            }
            
        }
        
        title = "Storm Viewer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showTapped))
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        cell.detailTextLabel?.text = "\(numbers[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.totalPictures = pictures.count
            vc.selectedPictureNumber = indexPath.row + 1
            numbers[indexPath.row] += 1
            tableView.reloadData()
            self.save()
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @objc func showTapped(){
        guard let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") else { return }
        let recommendedString = "Recommend this app: \(displayName)"
        let vc = UIActivityViewController(activityItems: [recommendedString], applicationActivities: [])
        
        present(vc, animated: true, completion: nil)
    }
    
    func save(){
        UserDefaults.standard.set(numbers, forKey: "numbers")
    }
}

