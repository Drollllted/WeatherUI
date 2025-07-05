//
//  WeatherApp.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: MainViewModule())
        }
    }
}
