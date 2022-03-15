//
//  DetailViewController.swift
//  Project1
//
//  Created by Peter on 2022/02/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedPictureNumber = 0
    var totalPictures = 0
    var selectedImage: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(selectedImage != nil)
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        title = "Picture \(selectedPictureNumber) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
