//
//  MainViewModule.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import Foundation

final class MainViewModule: ObservableObject {
    
    @Published var locationService = LocationService()
    
    func getLocation() {
        print("12321")
        
        guard let latitude = locationService.location?.coordinate.latitude,
              let longitude = locationService.location?.coordinate.longitude else {return}
        print("location: \(latitude), \(longitude)")
        
    }

    
}
