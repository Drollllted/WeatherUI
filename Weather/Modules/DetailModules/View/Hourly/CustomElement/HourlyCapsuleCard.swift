//
//  HourlyCapsuleCard.swift
//  Weather
//
//  Created by Drolllted on 16.07.2025.
//

import SwiftUI

struct HourlyCapsuleCard: View {
    
    let time: String
    let temperature: String
    let precipitation: Int
    let cloudCover: Int
    
    var weatherIcon: String {
        if precipitation > 30 {
            return "cloud.rain.fill"
        } else if cloudCover > 70 {
            return "cloud.fill"
        } else if cloudCover > 30 {
            return "cloud.sun.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var body: some View {
        VStack(alignment: .center ,spacing: 8) {
            Text(time)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Image(systemName: weatherIcon)
                .foregroundStyle(getIconColor())
                .font(.title3)
            Text(temperature)
                .font(.headline)
            if precipitation > 0{
                Text("\(precipitation)%")
                    .font(.caption2)
                    .foregroundStyle(.blue)
            }
            
        }
        .frame(width: 60)
        .padding(.vertical, 8)
        .overlay {
            Capsule()
                .fill()
                .stroke(.purple, lineWidth: 1)
                .foregroundStyle(.clear)
        }
    }
    
    private func getIconColor() -> Color {
        if precipitation > 30 {
            return .blue
        } else if cloudCover > 70 {
            return .gray
        } else {
            return .yellow
        }
    }
    
}

#Preview {
    HourlyWeatherView(vm: MainViewModule())
}

