//
//  MainViewModule.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import Foundation

final class MainViewModule: ObservableObject {
    
    @Published var locationService = LocationService()
    @Published var networkService = NetworkService()
    
    func getLocation() {
        print("12321")
        
        guard let latitude = locationService.location?.coordinate.latitude,
              let longitude = locationService.location?.coordinate.longitude else {return}
        print("location: \(latitude), \(longitude)")
        
        DispatchQueue.main.async {
            print("23123")
            self.networkService.setupData(latitude: latitude, longitude: longitude)
        }
    }

    
}
