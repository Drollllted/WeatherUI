//
//  Extension+String.swift
//  Weather
//
//  Created by Drolllted on 16.07.2025.
//

import Foundation

extension String {
    
    func formatCity() -> String {
        let formatCity = self.components(separatedBy: "/")
        return formatCity.last ?? ""
    }
    
}
