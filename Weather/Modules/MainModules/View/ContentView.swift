//
//  ContentView.swift
//  Weather
//
//  Created by Drolllted on 04.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var sheetPosition: BottomSheetPosition = .middle
    @StateObject var vm: MainViewModule
    
    var body: some View {
        ZStack {
            // Основной контент
            VStack(spacing: 30) {
                HeaderView()
                CityAndDateView(vm: vm)
                
                ZStack {
                    Image("house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 390, height: 390)
                }
            }
            .padding()
            .background {
                ZStack{
                    Image("backView")
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            
            // Bottom Sheet
            BottomSheetView(position: $sheetPosition) {
                VStack(spacing: 16) {
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
            .task {
                vm.getLocation()
            }
        }
    }
}
#Preview {
    ContentView(vm: MainViewModule())
}
