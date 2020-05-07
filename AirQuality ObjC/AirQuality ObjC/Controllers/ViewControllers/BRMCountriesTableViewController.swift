//
//  BRMCountriesTableViewController.swift
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

import UIKit

class BRMCountriesTableViewController: UITableViewController {

    // MARK: - Outlets & Properties

    var countries: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BRMCityAirQualityController.fetchSupportedCountries { (countries) in
            if let countries = countries {
                self.countries = countries
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        let country = countries[indexPath.row]
        cell.textLabel?.text = country

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "ToStatesTVC" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? BRMStatesTableViewController else { return }
            let country = countries[indexPath.row]
            destinationVC.country = country
        }
    }
    
} //End
