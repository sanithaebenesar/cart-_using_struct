//
//  customTableViewCell.swift
//  cartStruct
//
//  Created by CH 002 on 22/09/22.

//
protocol customTableViewCellDelegate {
    func updatedQnty(num:Int?, index:IndexPath?)
}

import UIKit

class customTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productQuantity: UILabel!
     
    var itemNum = 0
    
    var delegate :customTableViewCellDelegate?
    var index : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func incrementButtonAction(_ sender: Any) {
        delegate?.updatedQnty(num: itemNum+1, index: index)
    }
    
    
    @IBAction func decrementButtonAction(_ sender: Any) {
        if (itemNum > 0) {
            delegate?.updatedQnty(num: itemNum-1, index: index)
            
        }
    }
}
