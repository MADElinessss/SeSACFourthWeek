//
//  DetailViewController.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/11/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    let urlString = "http://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "상세 화면"
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }

}
