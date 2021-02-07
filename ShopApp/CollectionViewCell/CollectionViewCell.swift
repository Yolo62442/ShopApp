//
//  CollectionViewCell.swift
//  ShopApp
//
//  Created by Zhansaya on 02.02.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifider = String(describing: CollectionViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    var delegate: ViewControllerDelegate?
    var item: ShopItem? = nil
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func addAction(_ sender: Any) {
        delegate?.addToCart(item: item!)
    }
    
}
