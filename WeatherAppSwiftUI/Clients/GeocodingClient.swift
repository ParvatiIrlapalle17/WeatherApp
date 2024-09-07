//
//  GeocodingClient.swift
//  WeatherApp
//
//  Created by Apple on 06/09/24.
//

import Foundation

enum NetworkError:Error{
    case invalidResponse
}
struct GeocodingClient{
    func coordinateByCity(_ city : String) async throws -> Location?{
        let (data ,response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .coordinateByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        print("httpResponse=\(httpResponse)")
        let location = try JSONDecoder().decode([Location].self,from: data)
        return location.first
    }
}
