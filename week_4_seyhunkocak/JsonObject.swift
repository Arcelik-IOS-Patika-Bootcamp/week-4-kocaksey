//
//  JsonObject.swift
//  week_4_seyhunkocak
//
//  Created by Seyhun Koçak on 11.06.2022.
//

import Foundation

struct JsonObject : Codable {
    
    let cryptoName : String
    let cryptoPrice : Float
    let cryptoLogoUrl : String
    let cryptoChangePercentage24h : Float
    
    enum CodingKeys : String , CodingKey {
        case cryptoName = "name"
        case cryptoLogoUrl = "image"
        case cryptoPrice = "current_price"
        case cryptoChangePercentage24h = "price_change_percentage_24h"
    }
}
