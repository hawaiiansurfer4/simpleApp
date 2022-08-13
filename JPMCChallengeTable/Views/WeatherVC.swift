//
//  ViewController.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import UIKit



class WeatherVC: UITableViewController, WeatherManagerDelegate {
    
    var weatherArray = [Weather.Dataseries]()
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: [Weather.Dataseries]) {
        DispatchQueue.main.async {
            self.weatherArray = weather
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(LocalizedError.self)
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        cell.timepointLabel.text = "Time Point: \(weatherArray[0].timepoint)"
        cell.cloudCover.text = "Cloud Cover: \(weatherArray[0].cloudCover)"
        cell.transparencyLabel.text = "Transparency: \(weatherArray[0].transparency)"
        if weatherArray[indexPath.row].wind10m.direction == "E" {
            cell.windImage.image = UIImage(systemName: "wind")
        } else {
            cell.windImage.image = nil
        }
        
        
        return cell
    }
    


}

