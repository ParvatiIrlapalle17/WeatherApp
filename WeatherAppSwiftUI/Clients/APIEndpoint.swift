//
//  APIEndpoint.swift
//  WeatherApp
//
//  Created by Apple on 06/09/24.
//

import Foundation
enum APIEndpoint{
    static let baseURL = "https://api.openweathermap.org"
    case coordinateByLocationName(String)
    case weatherByLatLon(Double,Double)
    private var path:String{
        switch self{
        case .coordinateByLocationName(let city):
            return "/geo/1.0/direct?q=\(city)&limit=5&appid=\(Constant.keys.Weather_API_KEY)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constant.keys.Weather_API_KEY)"
        }
    }
    static func endpointURL(for endpoint:APIEndpoint) -> URL{
        let endpoint = endpoint.path
        print("endpoint=\(URL(string:baseURL + endpoint)!)")
        return URL(string:baseURL + endpoint)!
    }
}
