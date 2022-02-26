//
//  DetailViewController.swift
//  MileStoneProject_Day1_to_Day3
//
//  Created by Peter on 2022/02/26.
//

import UIKit

class DetailViewController: UIViewController {

    var imageString: String?
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageString = imageString {
            imageView.image = UIImage(named: imageString)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
    }
    
    @objc func shareFlag(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        // 아래 코드는 iPad 에서만 적용되고, iPhone 에서는 무시된다.
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

