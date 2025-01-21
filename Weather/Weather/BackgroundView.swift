//
//  BackgroundView.swift
//  Weather
//
//  Created by rose matheo on 21/01/2025.
//

import SwiftUI

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    BackgroundView(topColor: .blue, bottomColor: .white)
}
