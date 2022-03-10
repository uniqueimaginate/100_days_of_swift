//
//  ViewController.swift
//  Project10
//
//  Created by Peter on 2022/03/02.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        
        let defaults = UserDefaults.standard

        if let savedPeople = defaults.object(forKey: "people") as? Data {
            if let decodedPeople = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedPeople) as? [Person] {
                people = decodedPeople
            }
        }
    }
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]

        let ac = UIAlertController(title: "Delete or Rename?", message: nil, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Delete person", style: .destructive, handler: { [weak self]_ in
            guard let self = self else { return }
            let path = self.getDocumentsDirectory().deletingPathExtension().appendingPathComponent(person.image)
            
            guard let success = try? FileManager.default.removeItem(atPath: path.path) else { return }
            
            print("delete success")
            self.people.remove(at: indexPath.item)
            self.collectionView.reloadData()
            self.save()
            
            
        }))
        ac.addAction(UIAlertAction(title: "Rename person", style: .default, handler: { [weak self] _ in
            
            let renameAc = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
            renameAc.addTextField()
            renameAc.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            renameAc.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak renameAc] _ in
                guard let newName = renameAc?.textFields?[0].text else { return }
                person.name = newName

                self?.collectionView.reloadData()
                self?.save()
            })

            self?.present(renameAc, animated: true)
            
        }))

        present(ac, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        let person = people[indexPath.item]
        cell.name.text = person.name
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        return cell
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

            let imageName = UUID().uuidString
            let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

            if let jpegData = image.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: imagePath)
            }
            let person = Person(name: "Unknown", image: imageName)
            people.append(person)
            collectionView.reloadData()
            self.save()
        
            dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
    }
    
    func save() {
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: people, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        }
    }

}

