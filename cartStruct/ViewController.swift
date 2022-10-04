//
//  ViewController.swift
//  cartStruct
//
//  Created by CH 002 on 22/09/22
//

struct product {
    var name : String
    var imgae : String
    var price : Int
    var quantity : Int
}
import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var productTable: UITableView!
    
    @IBOutlet weak var totalAmount: UILabel!
     
    var productDetails = [product(name: "camera", imgae: "camera", price: 40000, quantity: 0),product(name: "umbrella", imgae: "umbrella", price: 900, quantity: 1),product(name: "watch", imgae: "watch", price: 3000, quantity: 0),product(name: "bag", imgae: "bag", price: 2000, quantity: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productTable.dataSource = self
        productTable.delegate = self
       // totalAmount.text = "\( totalPrice())"
    }


}
extension ViewController : customTableViewCellDelegate {
    func updatedQnty(num: Int?, index: IndexPath?) {
        if let index = index  {
            productDetails[index.row].quantity = num!
        }
        productTable.reloadData()
        totalAmount.text = "\(totalPrice())"
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productDetails.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell") as! customTableViewCell
    cell.delegate = self
    cell.index = indexPath
    
    cell.productImage.image = UIImage(named: productDetails[indexPath.row].imgae)
    cell.productImage.layer.name = productDetails[indexPath.row].name
    cell .productPrice.text = "\(productDetails[indexPath.row].price)"

    cell.productQuantity.text = "\(productDetails[indexPath.row].quantity)"
    cell.itemNum = productDetails[indexPath.row].quantity
    
    return cell
}


func totalPrice ()-> Int {
    var sum = 0
    for product in productDetails {
        sum += (product.price)*(product.quantity)
    }
    return sum
}
    
}
