//
//  WebViewController.swift
//  Project16
//
//  Created by Peter on 2022/03/13.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var url: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url1 = url {
            guard let uurl = URL(string: url1) else {
                print("error")
                return
            }
            webView.load(URLRequest(url: uurl))
        }
//        webView.load(<#T##request: URLRequest##URLRequest#>)
    }
    


}
