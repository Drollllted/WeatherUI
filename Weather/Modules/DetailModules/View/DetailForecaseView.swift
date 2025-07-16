//
//  DetailForecaseView.swift
//  Weather
//
//  Created by Drolllted on 05.07.2025.
//

import SwiftUI

struct DetailForecaseView: View {
    
    @ObservedObject var vm: MainViewModule
    
    var body: some View {
        VStack(spacing: 20){
            HourlyWeatherView(vm: vm)
        }
    }
}

#Preview {
    DetailForecaseView(vm: MainViewModule())
}
