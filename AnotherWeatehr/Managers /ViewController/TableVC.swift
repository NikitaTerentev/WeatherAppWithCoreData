//
//  TableVC.swift
//  AnotherWeatehr
//
//  Created by Nikita on 15.12.2021.
//

import UIKit
import CoreData 

var coreDataStorage = [Cities]()

class TableVC: UITableViewController {
    
    
    
    private let jsonTask = APIManager()
    private var cityTemps: [WeatherModel] = []
    private let coreDataManaer = CoreDataManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let weathers = coreDataManaer.fetch()
        cityTemps = weathers.map(WeatherModel.init(weather:))
        tableView.reloadData()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func addSomeCity(_ sender: Any) {
     
        alert(onSelect: { [weak self] cityName in
            self?.jsonTask.getSomeCity(for: cityName) { result in

                DispatchQueue.main.async {
                    if let model = try? result.get() {
                        self?.coreDataManaer.saveCity(cityName: model.name, temp: model.main.temp)
                        self?.cityTemps.append(WeatherModel(weather: model))
                        self?.tableView.reloadData()
                    }
                }
            }
        })
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityTemps.count
    }

//
//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cells
        
        cell.configure(with: cityTemps[indexPath.row].weather)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDel = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            self.cityTemps.remove(at: indexPath.row)
            self.coreDataManaer.deleteCity()
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
        let actions = UISwipeActionsConfiguration(actions: [actionDel])
        return actions
    }

}
