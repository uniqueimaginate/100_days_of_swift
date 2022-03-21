//
//  ViewController.swift
//  MileStoneProject_Project19_to_Project21
//
//  Created by Peter on 2022/03/18.
//

import UIKit

class ViewController: UITableViewController {

    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        if let savedNotes = defaults.object(forKey: "notes") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                notes = try jsonDecoder.decode([Note].self, from: savedNotes)
            } catch {
                print("Failed to load notes")
            }
        }
        
        
        title = "메모"
        navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(writeMemo))
        navigationItem.rightBarButtonItem = addButton
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.noteTitle = notes[indexPath.row].title
            vc.noteContent = notes[indexPath.row].content
            vc.uuid = notes[indexPath.row].uuid
            vc.dateString = notes[indexPath.row].date
            vc.mode = .edit
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func writeMemo(){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.mode = .make
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func save(){
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(notes){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "notes")
        } else {
            print("Failed")
        }
    }
}

extension ViewController: DetailViewDelegate {
    func makeNote(note: Note) {
        notes.append(note)
        notes.sort{ $0.date > $1.date }
        tableView.reloadData()
        save()
    }
    
    func editNote(note: Note) {
        let index = notes.firstIndex { $0.uuid == note.uuid }!
        print(index)
        notes[index] = note
        notes.sort{ $0.date > $1.date }
        tableView.reloadData()
        save()
    }
}

struct Note: Codable {
    let uuid: String
    let title: String
    let content: String
    let date: String
}
