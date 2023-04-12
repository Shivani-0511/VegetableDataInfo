//
//  ResultViewController.swift
//  VegetableDataInfo
//
//  Created by Apple on 12/04/23.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTableView: UITableView!
    var vegetableDetail : VegetableData?

    override func viewDidLoad() {
        super.viewDidLoad()

        resultTableView.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        resultTableView.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.identifier)
    }
    

    

}
extension ResultViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = resultTableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
            if let vegImage = vegetableDetail?.imagename,let vegName = vegetableDetail?.name{
                cell.configure(name: vegName, image: vegImage)
                return cell
            }
            
        }
        let cell = resultTableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
        if let info = vegetableDetail?.description{
            cell.configure(description: info)
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if indexPath.section == 0{
             return 200
         }
         return UITableView.automaticDimension
     }
    
    
}
