//
//  ContentView.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sheetPosition: BottomSheetPosition = .middle
    
    var body: some View {
        ZStack {
            // Основной контент
            ScrollView(.vertical) {
                VStack(spacing: 30) {
                    HeaderView()
                    CityAndDateView()
                    
                    ZStack {
                        Image("house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 390, height: 390)
                    }
                }
                .padding()
                .background {
                    Image("backView")
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                }
            }
            
            // Bottom Sheet
            BottomSheetView(position: $sheetPosition) {
                VStack(spacing: 16) {
                    // Индикатор для жеста
                    Capsule()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 40, height: 5)
                        .padding(.top, 10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                sheetPosition = (sheetPosition == .middle) ? .top : .middle
                            }
                        }
                    
                    // Контент нижней панели
                    if sheetPosition == .top {
                    } else {
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
