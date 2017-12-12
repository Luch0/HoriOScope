//
//  HoroscopeResponseAPIClient.swift
//  HoriOScope
//
//  Created by Luis Calle on 12/11/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class HoroscopeResponseAPIClient {
    
    private init() {}
    static let manager = HoroscopeResponseAPIClient()
    
    func getHoroscope(from urlStr: String, completionHandler: @escaping (HoroscopeResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        let request = URLRequest(url: url)
        let completion = {(data: Data) -> Void in
            do {
                let onlineHoroscope = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
                completionHandler(onlineHoroscope)
            }
            catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
    }
    
}
