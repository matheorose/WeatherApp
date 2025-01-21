//
//  ContentView.swift
//  Weather
//
//  Created by rose matheo on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    @State private var forecasts: [Forecast] = [
        Forecast(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 20),
        Forecast(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 10),
        Forecast(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 0),
        Forecast(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 2),
        Forecast(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 10)
    ]
    
    var body: some View {
        ZStack{
            
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: .white)
            
            VStack{
                HStack{
                    Text("Cupertino, CA")
                        .font(.largeTitle).bold()
                        .foregroundStyle(.white)
                    
                    Button {
                        reloadTemperature()
                    }label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
                
                Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:180, height: 180)
                
                Text("22°")
                    .font(.system(size:70, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(.bottom, 40)
                
                HStack(spacing:20) {
                    WeatherDayView(forecast: forecasts[0])
                    WeatherDayView(forecast: forecasts[1])
                    WeatherDayView(forecast: forecasts[2])
                    WeatherDayView(forecast: forecasts[3])
                    WeatherDayView(forecast: forecasts[4])
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
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
    
    func reloadTemperature(){
        for i in 0..<forecasts.count {
            forecasts[i].temperature += 1
        }
    }
}

struct WeatherDayView: View {
    
    var forecast: Forecast
    
    var body: some View {
        VStack{
            Text(forecast.dayOfWeek)
                .font(.title2)
                .foregroundStyle(.white)
            Image(systemName: forecast.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40, height: 40)
            Text("\(forecast.temperature)°")
                .font(.title2)
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    ContentView()
}
