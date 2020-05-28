//
//  ViewController.swift
//  Timeless-BEAUTY
//
//  Created by Андрей on 14.04.2020.
//  Copyright © 2020 Андрей. All rights reserved.
//

import UIKit

enum mainScreen: String, CaseIterable {
    case shearts = "s-heart-s"
    case tokioInkarami = "tokioInkarami"
    case clion = "clion"
    case myWhiteSecret = "myWhiteSecret"
    case timelessTruthMask = "timelessTruthMask"
    case benten = "benten"
}


class MainScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    private let brand = mainScreen.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brand.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.imageBrand.image = UIImage(named: brand[indexPath.item].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let brandAction = brand[indexPath.item]
        let nameBrand = brand[indexPath.item].rawValue
        
        switch brandAction {
        case .shearts:
            webScreen(nameBrand)
        case .tokioInkarami:
            webScreen(nameBrand)
        case .clion:
            webScreen(nameBrand)
        case .myWhiteSecret:
            webScreen(nameBrand)
        case .timelessTruthMask:
            webScreen(nameBrand)
        case .benten:
            webScreen(nameBrand)
        }
    }
    
}

extension MainScreenViewController {
    
    func webScreen(_ nameBrand: String) {
        
        let webScreen = storyboard?.instantiateViewController(identifier: "WebStoreViewController") as! WebStoreViewController
        webScreen.modalPresentationStyle = .fullScreen
        webScreen.nameBrand = nameBrand
        present(webScreen, animated: true)
    }
    
}
