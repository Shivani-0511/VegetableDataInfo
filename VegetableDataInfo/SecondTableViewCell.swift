//
//  SecondTableViewCell.swift
//  VegetableDataInfo
//
//  Created by Apple on 12/04/23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    static let identifier = "SecondTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
    }
    @IBOutlet weak var myDescription: UILabel!
    func configure(description:String){
        myDescription.text = description
        
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
