//
//  WebStoreViewController.swift
//  Timeless-BEAUTY
//
//  Created by Андрей on 15.04.2020.
//  Copyright © 2020 Андрей. All rights reserved.
//

import UIKit
import WebKit

class WebStoreViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var progressOutlet: UIProgressView!
    @IBOutlet weak var webOutlet: WKWebView!
    
    private let webURL = WebURL()
    private let nameURL = NameURL()
    var nameBrand = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView()
        urlString()
    }
    
    @IBAction func exitButton() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension WebStoreViewController {
    
    func progressView() {
        progressOutlet.progress = 0
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWeb), userInfo: nil, repeats: true)
    }
    
    @objc func updateWeb() {
        if progressOutlet.progress != 1 {
            progressOutlet.progress += 0.2
        } else {
            progressOutlet.isHidden = true
        }
    }
    
    func web(_ url: String) {
        
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        webOutlet.load(request)
    }
    
    func urlString() {
        if nameBrand == nameURL.shearts {
            web(webURL.shearts)
        } else if nameBrand == nameURL.tokioInkarami {
            web(webURL.tokioInkarami)
        } else if nameBrand == nameURL.clion {
            web(webURL.clion)
        } else if nameBrand == nameURL.myWhiteSecret {
            web(webURL.myWhiteSecret)
        } else if nameBrand == nameURL.timelessTruthMask {
            web(webURL.timelessTruthMask)
        } else if nameBrand == nameURL.benten {
            web(webURL.benten)
            backButton.isHidden = true
            nextButton.isHidden = true
        }
    }
}
