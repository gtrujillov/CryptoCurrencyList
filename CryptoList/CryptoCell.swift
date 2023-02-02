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
        // Personalización de los labels
        cryptoNameLabel.textColor = UIColor.blue
        cryptoPriceLabel.textColor = UIColor.blue

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
