//
//  CityAndDateView.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import SwiftUI

struct CityAndDateView: View {
    
    @StateObject var vm: MainViewModule
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text(vm.weatherJSON?.timezone.formatCity() ?? "Unknown")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("\(Int(vm.weatherJSON?.daily.temperature2MMax.min() ?? 0.0).description)°")
                .font(.system(size: 96))
                .fontWeight(.ultraLight)
                .foregroundStyle(.white)
            
            Text("Mostly Clear")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            
            HStack(alignment: .center, spacing: 5){
                
                Text("H: \(Int(vm.weatherJSON?.daily.temperature2MMax.max() ?? 0.0).description)°")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
                Text("L: \(Int(vm.weatherJSON?.daily.temperature2MMin.min() ?? 0.0).description)°")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
            }
        }
    }
}

#Preview {
    CityAndDateView(vm: MainViewModule())
        .preferredColorScheme(.dark)
}
