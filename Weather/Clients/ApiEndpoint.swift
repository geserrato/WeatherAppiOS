//
//  ApiEndpoint.swift
//  Weather
//
//  Created by Gerardo Estrella on 06/11/24.
//

import Foundation

enum ApiEndpoint {
    static let baseURL = "https://api.openweathermap.org"
    case coordinateByLocationnName(String)
    case weatherByLatlon(Double, Double)

    private var path: String {
        switch self {
            case .coordinateByLocationnName(let city):
                return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherApiKey)"
            case .weatherByLatlon(let lat, let lon):
                return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.weatherApiKey)"
        }
    }
    
    static func endpointUrl(for endpoint: ApiEndpoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: "\(baseURL)\(endpointPath)")!
    }
}
