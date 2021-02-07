//
//  ViewController.swift
//  ShopApp
//
//  Created by Zhansaya on 02.02.2021.
//

import UIKit
protocol ViewControllerDelegate {
    func addToCart(item: ShopItem)
    func getCart() -> [ShopItem]
    func newCart()
}

class ViewController: UIViewController {
    @IBOutlet weak var changeSegment: UISegmentedControl!
    
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var arr = [ShopItem]()
    var cart = [ShopItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = false
        collectionView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifider)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifider)
        dataConfig()
        // Do any additional setup after loading the view.
    }
    
    func dataConfig()  {
        arr.append(ShopItem(id: 1, title: "T-shirt", description: "Size: XS", price: 26.3, image: "item1"))
        arr.append(ShopItem(id: 2, title: "Wand", description: "Width: 34sm", price: 10.23, image: "item2"))
        arr.append(ShopItem(id: 3, title: "Glasses", description: "Color: Black", price: 7.8, image: "item3"))
        arr.append(ShopItem(id: 4, title: "Cup", description: "Volume: 200ml", price: 12.3, image: "item4"))
        arr.append(ShopItem(id: 5, title: "Ring", description: "House: Ravenclaw", price: 6.4, image: "item5"))
        arr.append(ShopItem(id: 6, title: "Tie", description: "House: Slytherin", price: 8.3, image: "item6"))
        arr.append(ShopItem(id: 7, title: "Snitch", description: "Golden Ball", price: 23.2, image: "item7"))
        arr.append(ShopItem(id: 8, title: "Sorting Hat", description: "Old Brown Hat", price: 56.8, image: "item8"))
        arr.append(ShopItem(id: 9, title: "Ticket", description: "From Platform 9 and 3/4", price: 14.5, image: "item9"))
        arr.append(ShopItem(id: 10, title: "Sword", description: "House: Gryffindor", price: 125.6, image: "item10"))
    }
    @IBAction func changeView(_ sender: Any) {
        if(collectionView.isHidden){
            tableView.isHidden = true
            collectionView.isHidden = false
        }else{
            tableView.isHidden = false
            collectionView.isHidden = true
        }
    }
    @IBAction func cartAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
    }
    

}

extension ViewController: ViewControllerDelegate{
    func newCart() {
        cart = [ShopItem]()
    }
    
    func addToCart(item: ShopItem) {
        cart.append(item)
    }
    
    func getCart() -> [ShopItem] {
        return cart
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifider, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
        cell.item = item
        cell.delegate = self
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = ("\(item.price ?? 0)")
        cell.itemImage.image = UIImage(named: item.image ?? "background")
        return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(115)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
        vc.delegate = self
        vc.item = arr[indexPath.row]
        navigationController?.pushViewController(vc, animated: false)
    
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifider, for: indexPath) as! CollectionViewCell
        let item = arr[indexPath.row]
        cell.item = item
        cell.delegate = self
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = ("\(item.price ?? 0)")
        cell.itemImage.image = UIImage(named: item.image ?? "background")
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width/2
        return CGSize(width: width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
        vc.item = arr[indexPath.row]
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
    }
}
