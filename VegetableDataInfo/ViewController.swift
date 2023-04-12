//
//  ViewController.swift
//  VegetableDataInfo
//
//  Created by Apple on 12/04/23.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    var vegetableList = [VegetableData]()
    var vegetableSearch = [VegetableData]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        print(vegetableList)
       
    }
    func fetchData(){
        guard let fileLocation = Bundle.main.url(forResource: "Vegetables", withExtension: "json")else{
            return
            
        }
        do{
            let data = try Data(contentsOf: fileLocation)
            let recivedData = try JSONDecoder().decode([VegetableData].self, from: data)
            self.vegetableList = recivedData
            print(recivedData)
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }catch{
            print("Error Occured")
        }
    }


}
extension ViewController : UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return vegetableSearch.count
        }else{
            return vegetableList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching{
            cell.textLabel?.text = vegetableSearch[indexPath.row].name
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
            cell.imageView?.image = UIImage(named: vegetableSearch[indexPath.row].imagename)
            return cell
        }
        else{
            cell.textLabel?.text = vegetableList[indexPath.row].name
            cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 20)
            cell.imageView?.image = UIImage(named: vegetableList[indexPath.row].imagename)
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: .main)
        let vc = main.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        if searching == true{
            vc.vegetableDetail = VegetableData(name: vegetableSearch[indexPath.row].name, imagename: vegetableSearch[indexPath.row].imagename, description: vegetableSearch[indexPath.row].description)
        }
        else
        {
            vc.vegetableDetail = VegetableData(name: vegetableList[indexPath.row].name, imagename: vegetableList[indexPath.row].imagename, description: vegetableList[indexPath.row].description)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        vegetableSearch.removeAll()
        myTableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("UISearchBar, textDidChange=",searchText)

        if !searchText.isEmpty{
            searching = true
            vegetableSearch.removeAll()
            for vegetable in vegetableList{
                if vegetable.name.lowercased().contains(searchText.lowercased()){
                    vegetableSearch.append(vegetable)
                }
            }
        }
        else{
            searching=false
            vegetableSearch.removeAll()
            vegetableSearch=vegetableList
        }
        myTableView.reloadData()
    }
    
}

