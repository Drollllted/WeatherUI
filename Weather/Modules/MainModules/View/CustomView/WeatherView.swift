//
//  WeatherView.swift
//  Weather
//
//  Created by Drolllted on 05.07.2025.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        HStack(spacing: 15){
            Image("sunny")
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview{
    WeatherView()
}
