//
//  HoroscopeResponse.swift
//  HoriOScope
//
//  Created by Luis Calle on 12/11/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct HoroscopeResponse: Codable {
    let mood: String
    let date_range: String
    let color: String
    let description: String
    let lucky_time: String
    let compatibility: String
    let current_date: String
    let lucky_number: String
}
