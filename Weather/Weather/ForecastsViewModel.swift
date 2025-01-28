//
//  ForecastsViewModel.swift
//  Weather
//
//  Created by rose matheo on 28/01/2025.
//

import Foundation

class ForecastsViewModel: ObservableObject{
    @Published var forecasts: [Forecast] = []
    
    init() {
        getForecasts()
    }
    
    func getForecasts(){
        let newForecasts = [
            Forecast(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 20),
            Forecast(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 10),
            Forecast(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 0),
            Forecast(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 2),
            Forecast(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 10)
        ]
        
        self.forecasts += newForecasts
        
    }
    
    func reloadTemperature(){
        for i in 0..<forecasts.count {
            forecasts[i].temperature += 1
        }
    }
}
