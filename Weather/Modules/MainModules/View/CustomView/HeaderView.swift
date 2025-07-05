//
//  HeaderView.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(.black)
            
            Spacer()
            
            Image(systemName: "slider.horizontal.3")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(.black)
        }
    }
}

#Preview{
    HeaderView()
}
