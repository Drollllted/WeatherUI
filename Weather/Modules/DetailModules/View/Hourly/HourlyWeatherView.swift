//
//  WeatherView.swift
//  Weather
//
//  Created by Drolllted on 05.07.2025.
//

import SwiftUI

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var vm: MainViewModule
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text("Hourly Forecast")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                Spacer()
                
                Text("Week Forecast")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
            }
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    if let hourly = vm.weatherJSON?.hourly {
                        
                        let filteredForecast = self.filterIndicesForCurrentTime(hourlyTimes: hourly.time)
                        
                        ForEach(filteredForecast, id: \.self) { index in
                            HourlyCapsuleCard(
                                time: formatTime(hourly.time[index]),
                                temperature: "\(Int(hourly.temperature2M[index]))°",
                                precipitation: hourly.precipitationProbability[index],
                                cloudCover: hourly.cloudCover[index]
                            )
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
    }
    
    private func filterIndicesForCurrentTime(hourlyTimes: [String]) -> [Int] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        
        let currentDate = Date()
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: currentDate)
        
        var resultIndices = [Int]()
        
        for (index, timeString) in hourlyTimes.enumerated() {
            guard let date = dateFormatter.date(from: timeString) else { continue }
            let hour = calendar.component(.hour, from: date)
            
            if hour >= currentHour {
                resultIndices.append(index)
            }
        }
        
        return resultIndices.isEmpty ? Array(hourlyTimes.indices) : resultIndices
    }
    
    
    private func formatTime(_ timeString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        
        guard let date = dateFormatter.date(from: timeString) else {
            return timeString
        }
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

#Preview{
    HourlyWeatherView(vm: MainViewModule())
}
