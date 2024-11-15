//
//  Weather.swift
//  Weather
//
//  Created by Gerardo Estrella on 06/11/24.
//

import Foundation

struct WeatherResponse : Decodable {
    let main : Weather
}

struct Weather : Decodable {
    let temp : Double    
}
