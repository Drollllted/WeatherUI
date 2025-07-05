//
//  CityAndDateView.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import SwiftUI

struct CityAndDateView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text("Bengaluru")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("19°")
                .font(.system(size: 96))
                .fontWeight(.ultraLight)
                .foregroundStyle(.white)
            
            Text("Mostly Clear")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            
            HStack(alignment: .center, spacing: 5){
                
                Text("H: 24")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
                Text("L: 18")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                
            }
        }
    }
}

#Preview {
    CityAndDateView()
        .preferredColorScheme(.dark)
}
