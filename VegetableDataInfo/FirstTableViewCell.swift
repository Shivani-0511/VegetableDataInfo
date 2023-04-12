//
//  FirstTableViewCell.swift
//  VegetableDataInfo
//
//  Created by Apple on 12/04/23.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "FirstTableViewCell", bundle: nil)
    }
    @IBOutlet weak var myName: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    func configure(name:String,image:String){
        myName.text = name
        myImage.image = UIImage(named: image)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
