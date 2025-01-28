//
//  ContentView.swift
//  Weather
//
//  Created by rose matheo on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    @EnvironmentObject var forecastsVM: ForecastsViewModel
    
    var body: some View {
        ZStack{
            
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: .white)
            
            VStack{
                HStack{
                    Text("Cupertino, CA")
                        .font(.largeTitle).bold()
                        .foregroundStyle(.white)
                    
                    Button {
                        forecastsVM.reloadTemperature()
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
                    WeatherDayView(forecast: forecastsVM.forecasts[0])
                    WeatherDayView(forecast: forecastsVM.forecasts[1])
                    WeatherDayView(forecast: forecastsVM.forecasts[2])
                    WeatherDayView(forecast: forecastsVM.forecasts[3])
                    WeatherDayView(forecast: forecastsVM.forecasts[4])
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
        .environmentObject(ForecastsViewModel())
}
