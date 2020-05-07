//
//  BRMCityDataViewController.swift
//  AirQuality ObjC
//
//  Created by Bethany Morris on 5/6/20.
//

import UIKit

class BRMCityDataViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var airQualityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    // MARK: - Properties
    
    var country: String?
    var state: String?
    var city: String?
        
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let country = country, let state = state, let city = city else { return }
        BRMCityAirQualityController.fetchData(forCity: city, state: state, country: country) { (cityData) in
            if let cityData = cityData {
                self.updateViews(with: cityData)
            }
        }
    }
    
    // MARK: - Methods
    
    func updateViews(with cityData: BRMCityAirQuality) {
        BRMCityAirQualityController.fetchWeatherIcon(cityData) { (icon) in
            DispatchQueue.main.async {
                self.title = "\(cityData.city)"
                self.weatherIconImageView.image = icon
                self.temperatureLabel.text = "\(cityData.weather.temperature)°C"
                self.cityLabel.text = self.city
                self.stateLabel.text = self.state
                self.countryLabel.text = self.country
                self.humidityLabel.text = "\(cityData.weather.humidity)%"
                self.windSpeedLabel.text = "\(cityData.weather.windSpeed) m/s"
                self.airQualityLabel.text = "\(cityData.pollution.airQualityIndex)"
                
                switch true {
                case cityData.pollution.airQualityIndex <= 50:
                    self.airQualityLabel.textColor = .green
                case cityData.pollution.airQualityIndex <= 100:
                    self.airQualityLabel.textColor = .yellow
                case cityData.pollution.airQualityIndex <= 150:
                    self.airQualityLabel.textColor = .orange
                case cityData.pollution.airQualityIndex <= 200:
                    self.airQualityLabel.textColor = .red
                case cityData.pollution.airQualityIndex > 200:
                    self.airQualityLabel.textColor = .purple
                default:
                    self.airQualityLabel.textColor = .white
                }
            }
        }
    }
    

} //End
