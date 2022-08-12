//
//  ViewController.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import UIKit

class WeatherVC: UITableViewController {
    
    var weatherModel = [Weather]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        cell.timepointLabel.text = "Time Point: \(weatherModel[indexPath.row].dataseries.first)"
        cell.cloudCover.text = "Cloud Cover: \(weatherModel[indexPath.row].dataseries[indexPath.row].cloudCover)"
        cell.transparencyLabel.text = "Transparency: \(weatherModel[indexPath.row].dataseries[indexPath.row].transparency)"
        if weatherModel[indexPath.row].dataseries[indexPath.row].wind10m[indexPath.row].direction == "E" {
            cell.windImage.image = UIImage(systemName: "wind")
        } else {
            cell.windImage.image = nil
        }
        
        
        return cell
    }
    
    func fetchData() {
        guard let weatherURL = URL(string: "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0") else {
            return
        }
        
        URLSession.shared.dataTask(with: weatherURL) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let weatherInfo = self.parseData(data: data)
                if let weatherInfo = weatherInfo {
                    self.weatherModel = weatherInfo
                }
            } catch {
                fatalError("Error fetching data")
            }
        }
    }
    
    func parseData(data: Data) -> [Weather]? {
        var toBeReturned: [Weather]?
        let decoder = JSONDecoder()
        do {
            toBeReturned = try decoder.decode([Weather].self, from: data)
        } catch {
            fatalError("Unable to parse data")
        }

        return toBeReturned
    }

}

