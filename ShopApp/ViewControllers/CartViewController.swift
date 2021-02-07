//
//  CartViewController.swift
//  ShopApp
//
//  Created by Zhansaya on 07.02.2021.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var buyButton: UIButton!
    var delegate: ViewControllerDelegate?
    var arr = [ShopItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = delegate!.getCart()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifider)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func buyAction(_ sender: Any) {
        let alert = UIAlertController(title: "Thank you", message: "Operation was successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.back()
        }))
        self.present(alert, animated: false, completion: nil)
        
    }
    func back() {
        delegate?.newCart()
        navigationController?.popViewController(animated: false)
    }
}
    extension CartViewController: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifider, for: indexPath) as! TableViewCell
            let item = arr[indexPath.row]
            cell.item = item
            cell.titleLabel.text = item.title
            cell.descriptionLabel.text = item.description
            cell.priceLabel.text = ("\(item.price ?? 0)")
            cell.itemImage.image = UIImage(named: item.image ?? "background")
            cell.addButton.isHidden = true
            return cell
           
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(115)
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
            vc.item = arr[indexPath.row]
            navigationController?.pushViewController(vc, animated: false)
        
        }
    }



