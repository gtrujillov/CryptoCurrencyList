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
    
    
    @IBOutlet weak var hightStackView: UIStackView!
    @IBOutlet weak var lowStackView: UIStackView!
    @IBOutlet weak var volumeStackView: UIStackView!
    
    var name = ""
    var hPrice = 0.0
    var lPrice = 0.0
    var volumePrice = 0.0
    var img = UIImage()
    
    //Custom color
    let color = UIColor(red: 0.88, green: 0.44, blue: 0.33, alpha: 1.00).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailCryptoName.text = name
        hightPrice.text = "\(String(hPrice)) €"
        lowPrice.text = "\(String(lPrice)) €"
        volume.text = "\(String(volumePrice)) €"
        detailImage.image = img
        
        hightStackView.layer.backgroundColor = color
        hightStackView.layer.cornerRadius = 15
        
        lowStackView.layer.backgroundColor = color
        lowStackView.layer.cornerRadius = 15
        
        volumeStackView.layer.backgroundColor = color
        volumeStackView.layer.cornerRadius = 15
        
        detailImage.layer.cornerRadius = detailImage.frame.size.width / 2
        detailImage.clipsToBounds = true
        
    }
    

}
