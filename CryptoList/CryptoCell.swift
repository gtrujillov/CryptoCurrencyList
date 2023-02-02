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
        
        // Personalización de la apariencia de la celda
        self.backgroundColor = UIColor.gray
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        
        // Personalización de los labels
        cryptoNameLabel.textColor = UIColor.purple
        cryptoPriceLabel.textColor = UIColor.purple
        
        // Personalización de la imagen
        cryptoImage.layer.cornerRadius = cryptoImage.frame.width / 2
        cryptoImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
