//
//  MainViewModule.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import Foundation

final class MainViewModule: ObservableObject {
    
    @Published var weatherJSON: WelcomeJSON?
    @Published var locationService = LocationService()
    @Published var networkService = NetworkService()
    
    func getLocation() {
        print("12321")
        
        guard let latitude = locationService.location?.coordinate.latitude,
              let longitude = locationService.location?.coordinate.longitude else {return}
        print("location: \(latitude), \(longitude)")
        
        DispatchQueue.main.async {
            print("23123")
        }
    }
    
    func fetchWeather(latitude: Double, longitude: Double) {
        networkService.setupData(latitude: latitude, longitude: longitude) { [weak self] result in
            switch result{
                
            case .success(let data):
                self?.weatherJSON = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
}
