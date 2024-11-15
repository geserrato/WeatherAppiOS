//
//  WeatherClient.swift
//  Weather
//
//  Created by Gerardo Estrella on 07/11/24.
//

import Foundation

struct WeatherClient {
    func fetchWeather(for location: Location) async throws -> Weather {
        let (data,response) = try await URLSession.shared.data(from: ApiEndpoint.endpointUrl(for: .weatherByLatlon(location.lat, location.lon)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
         
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
    }
}
