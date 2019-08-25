//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Shwetansh Srivastava on 21/08/19.
//  Copyright © 2019 Shwetansh Srivastava. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // as it return an option its better to unwrap it only if it is present
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL.init(fileURLWithPath: htmlPath)
            let request = URLRequest.init(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
