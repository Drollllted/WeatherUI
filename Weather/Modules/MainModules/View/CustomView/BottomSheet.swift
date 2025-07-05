//
//  BottomSheet.swift
//  Weather
//
//  Created by Drolllted on 05.07.2025.
//

import SwiftUI
enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 
    case middle = 0.385
}

struct BottomSheetView<Content: View>: View {
    @Binding var position: BottomSheetPosition
    @GestureState private var translation: CGFloat = 0
    let content: Content
    
    init(position: Binding<BottomSheetPosition>, @ViewBuilder content: () -> Content) {
        self._position = position
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.content
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 10)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.position.offset(in: geometry) + self.translation, 0))
            .animation(.interactiveSpring(), value: self.position)
            .animation(.interactiveSpring(), value: self.translation)
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = geometry.size.height * 0.1
                    let newPosition = self.position.nearest(to: value.translation.height, in: geometry, snapDistance: snapDistance)
                    self.position = newPosition
                }
            )
        }
    }
}

extension BottomSheetPosition {
    func offset(in geometry: GeometryProxy) -> CGFloat {
        geometry.size.height - (geometry.size.height * self.rawValue)
    }
    
    func nearest(to value: CGFloat, in geometry: GeometryProxy, snapDistance: CGFloat) -> BottomSheetPosition {
        let currentOffset = offset(in: geometry) + value
        let positions = BottomSheetPosition.allCases.map { position in
            (position: position, offset: position.offset(in: geometry))
        }
        
        let nearest = positions.min { lhs, rhs in
            abs(lhs.offset - currentOffset) < abs(rhs.offset - currentOffset)
        }!.position

        for position in positions {
            if abs(position.offset - currentOffset) < snapDistance {
                return position.position
            }
        }
        
        return nearest
    }
}
