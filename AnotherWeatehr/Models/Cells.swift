//
//  Cells.swift
//  AnotherWeatehr
//
//  Created by Nikita on 15.12.2021.
//

import UIKit
import CoreData
import Foundation


class Cells: UITableViewCell {
        
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!


    
    func configure(with tempCity: Weather?) {
        cityLabel.text = tempCity?.name
        if let temp = tempCity?.main.temp {
            tempLabel.text = String(format: "%.0f", temp.kelvinToCelsius) + "˚C"
        } else {
            tempLabel.text = nil
        }
    }
//
//
//    func CoreDataSave() {
//        let apppDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = apppDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Cities", in: context)
//        let cityTempEnty = Cities(entity: entity!, insertInto: context)
//
//        cityTempEnty.cityName = cityLabel.text
//        if let temp = tempLabel {
//            cityTempEnty.cityTemp = Double(temp.text!) ?? 0
//        } else {
//            cityTempEnty.cityTemp = 0
//        }
//
//        do {
//            try context.save()
//            coreDataStorage.append(cityTempEnty)
//        } catch  {
//            print("error context")
//        }
//    }

//    
//    func CoreDataSave(with tempCity: Weather?) {
//        let apppDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context: NSManagedObjectContext = apppDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Cities", in: context)
//        let cityTempEnty = Cities(entity: entity!, insertInto: context)
//
//        cityTempEnty.cityName = tempCity?.name
//        if let temp = tempCity?.main.temp {
//            cityTempEnty.cityTemp = temp //- 273.15
//        } else {
//            cityTempEnty.cityTemp = 0
//        }
//
//        do {
//            try context.save()
//            coreDataStorage.append(cityTempEnty)
//        } catch  {
//            print("error context")
//        }
//    }

}
