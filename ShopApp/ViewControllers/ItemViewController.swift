//
//  ItemViewController.swift
//  ShopApp
//
//  Created by Zhansaya on 07.02.2021.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var delegate: ViewControllerDelegate?
    var item: ShopItem?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(delegate == nil){
            addButton.isHidden = true
        }
        itemImage.image = UIImage(named: item?.image ?? "background")
        titleLabel.text = item?.title
        descriptionLable.text = item?.description
        priceLabel.text = ("\(item?.price ?? 0)")
        // Do any additional setup after loading the view.
    }
    @IBAction func addAction(_ sender: Any) {
        delegate?.addToCart(item: item!)
        navigationController?.popViewController(animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
