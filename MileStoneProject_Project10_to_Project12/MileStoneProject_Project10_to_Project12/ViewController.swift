//
//  ViewController.swift
//  MileStoneProject_Project10_to_Project12
//
//  Created by Peter on 2022/03/12.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPhoto))
        
        load()
//        print()
    }
    
    @objc func addNewPhoto(){
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = photos[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let imagePath = getDocumentsDirectory().appendingPathComponent(photos[indexPath.row].image)
            vc.selectedImage = imagePath.path
            
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }

        
        dismiss(animated: true) {
            let vc = UIAlertController(title: "Give Photo name", message: "photo name", preferredStyle: .alert)
            vc.addTextField()
            let action = UIAlertAction(title: "Confirm", style: .default) { _ in
                if let text = vc.textFields?[0].text {
                    let photo = Photo(name: text, image: imageName)
                    self.photos.append(photo)
                    self.save()
                    self.tableView.reloadData()
                }
            }
            vc.addAction(action)
            self.present(vc, animated: true)
        }
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save(){
        if let data = try? JSONEncoder().encode(photos){
            let defaults = UserDefaults.standard
            defaults.set(data, forKey: "photos")
        } else {
            print("Failed to save photos")
        }
    }
    
    func load(){
        if let savedPhotos = UserDefaults.standard.object(forKey: "photos") as? Data {
            do {
                photos = try JSONDecoder().decode([Photo].self, from: savedPhotos)
            } catch {
                print("Failed to load photos")
            }
        }
    }
}

