//
//  BRMStatesTableViewController.swift
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

import UIKit

class BRMStatesTableViewController: UITableViewController {

    // MARK: - Outlets & Properties
    
    var country: String?
    var states: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let country = country else { return }
        BRMCityAirQualityController.fetchSupportedStates(inCountry: country) { (states) in
            if let states = states {
                self.states = states
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return states.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)

        let state = states[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "ToCitiesTVC" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? BRMCitiesTableViewController else { return }
            let state = states[indexPath.row]
            destinationVC.state = state
            destinationVC.country = country
        }
    }

} //End
