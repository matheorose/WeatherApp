//
//  ContentView.swift
//  Weather
//
//  Created by rose matheo on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Cupertino, CA")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.white)
                
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:180, height: 180)
                
                Text("22°")
                    .font(.system(size:70, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(.bottom, 40)
                
                HStack(spacing:20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 20)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 25)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: 0)
                    WeatherDayView(dayOfWeek: "THU", imageName: "snow", temperature: 2)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 10)
                }
                
                Spacer()
                
                Button {
                    // action à réaliser
                    print("Button tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width:280, height: 50)
                        .background(Color.white)
                        .font(.title2).bold()
                        .cornerRadius(12)
                }
                
                Spacer()
            }
        }
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.title2)
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40, height: 40)
            Text("\(temperature)°")
                .font(.title2)
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    ContentView()
}
