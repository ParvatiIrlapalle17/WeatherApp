//
//  WeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Apple on 07/09/24.
//

import SwiftUI

struct WeatherView: View {
    let geoclient = GeocodingClient()
    @State private var weather : Weather?
    var weatherClient = WeatherClient()
    @State private var city : String = ""
    @State private var isFetchingWeather:Bool = false
    
    
    private func fetchWeather() async{
        do {
            guard let location = try await geoclient.coordinateByCity(city) else{return}
            print("Location lat = \(location.lat) Location long = \(location.lon)")
            weather = try await weatherClient.fetchWeather(location: location)
            print("Location = \(String(describing: weather?.temp))")
        }catch{
            print(error)
        }
    }
    var body: some View {
        VStack{
            TextField("City",text: $city).padding(EdgeInsets(top: 0.0, leading: 15.0, bottom: 0.0, trailing: 15.0)).textFieldStyle(.roundedBorder).onSubmit {
                isFetchingWeather = true
            }.task(id: isFetchingWeather) {
                if isFetchingWeather{
                    await fetchWeather()
                    isFetchingWeather = false
                    city = ""
                }
            }
            Spacer()
            if let weather{
                Text(city).font(.system(size: 50))
                Text(MeasurementFormatter.temperature(value: weather.temp)).font(.system(size: 100))
            }
            Spacer()
        }
    }
}

#Preview {
    WeatherView()
}
