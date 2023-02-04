//
//  DetailViewController.swift
//  CryptoList
//
//  Created by gonzalo trujillo vallejo on 3/2/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailCryptoName: UILabel!
    
    @IBOutlet weak var hightPrice: UILabel!
    
    @IBOutlet weak var lowPrice: UILabel!
    
    @IBOutlet weak var volume: UILabel!
    
    @IBOutlet weak var detailImage: UIImageView!
    
    var name = ""
    var hPrice = 0.0
    var lPrice = 0.0
    var volumePrice = 0.0
    var img = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailCryptoName.text = name
        hightPrice.text = "\(String(hPrice)) €"
        lowPrice.text = "\(String(lPrice)) €"
        volume.text = "\(String(volumePrice)) €"
        detailImage.image = img
        
    }
    

}
