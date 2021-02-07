//
//  TableViewCell.swift
//  ShopApp
//
//  Created by Zhansaya on 02.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifider = String(describing: TableViewCell.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    var item: ShopItem? = nil
    var delegate: ViewControllerDelegate?
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addAction(_ sender: Any) {
        delegate?.addToCart(item: item!)
    }
}
