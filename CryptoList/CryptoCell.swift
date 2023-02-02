//
//  CryptoCellTableViewCell.swift
//  CryptoList
//
//  Created by gonzalo trujillo vallejo on 2/2/23.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    
    @IBOutlet weak var cryptoNameLabel: UILabel!
    @IBOutlet weak var cryptoPriceLabel: UILabel!
    @IBOutlet weak var cryptoImage: UIImageView!
    
    let identifier = "CryptoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cryptoImage.layer.cornerRadius = cryptoImage.frame.size.width / 2
        cryptoImage.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
