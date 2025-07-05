//
//  NetworkService.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import Foundation

final class NetworkService {
    
    private let url = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41"
    private let temperature_2m = "&daily=temperature_2m_max,temperature_2m_min"
    private let hourlyTemperature = "&hourly=temperature_2m,precipitation_probability,cloud_cover"
    private let timeZoneAndOther = "&timezone=auto&past_days=1&forecast_days=1"
    
    func setupData(latitude: Double, longitude: Double, completion: @escaping (Result<WelcomeJSON, NetworkError>) -> Void) {
        guard let urlString = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)" + temperature_2m + hourlyTemperature + timeZoneAndOther) else {return}
        
        let task = URLSession.shared.dataTask(with: urlString) { data, _, _ in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let json = try jsonDecoder.decode(WelcomeJSON.self, from: data)
                print(json)
                completion(.success(json))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingFailed))
                
            }
        }
        task.resume()
    }
    
}
