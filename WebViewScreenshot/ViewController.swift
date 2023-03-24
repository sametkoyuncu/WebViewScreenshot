//
//  ViewController.swift
//  WebViewScreenshot
//
//  Created by Samet Koyuncu on 24.03.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var screenshotButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "https://www.samet.page")!))
        screenshotButton.layer.cornerRadius = screenshotButton.frame.height / 2
    }
    
    @IBAction func screenshotButtonTapped(_ sender: Any) {
        UIGraphicsBeginImageContextWithOptions(webView.bounds.size, false, 0)
        webView.drawHierarchy(in: webView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageView.image = image
    }
}

