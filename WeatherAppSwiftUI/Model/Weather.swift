//
//  Weather.swift
//  WeatherApp
//
//  Created by Apple on 06/09/24.
//

import Foundation
struct WeatherResponse:Decodable{
    var main:Weather
}
struct Weather:Decodable{
    var temp:Double
}
