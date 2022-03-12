//
//  DetailViewController.swift
//  MileStoneProject_Project10_to_Project12
//
//  Created by Peter on 2022/03/12.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var selectedImage: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedImage = selectedImage {
            image.image = UIImage(contentsOfFile: selectedImage)
        }
    }
    

}
