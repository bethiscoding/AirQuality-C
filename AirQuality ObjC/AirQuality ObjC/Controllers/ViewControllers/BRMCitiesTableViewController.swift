//
//  BRMCitiesTableViewController.swift
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

import UIKit

class BRMCitiesTableViewController: UITableViewController {

    // MARK: - Outlets & Properties
    
    var country: String?
    var state: String?
    var cities: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let country = country, let state = state else { return }
        BRMCityAirQualityController.fetchSupportedCities(inState: state, country: country) { (cities) in
            if let cities = cities {
                self.cities = cities
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)

        let city = cities[indexPath.row]
        cell.textLabel?.text = city

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "ToCityDataVC" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? BRMCityDataViewController else { return }
            let city = cities[indexPath.row]
            destinationVC.city = city
            destinationVC.state = state
            destinationVC.country = country
        }
    }
    

} //End
