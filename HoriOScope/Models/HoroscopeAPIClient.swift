//
//  HoroscopePostAPIClient.swift
//  HoriOScope
//
//  Created by Luis Calle on 12/11/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class HoroscopeAPIClient {
    private init() { }
    static let manager = HoroscopeAPIClient()
    
    func post(horoscopePost: HoroscopePost, completionHandler: @escaping (HoroscopeResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        let urlStr = "https://aztro.herokuapp.com/?sign=\(horoscopePost.sign)&day=\(horoscopePost.day)"

        guard let url = URL(string: urlStr) else { return }
        var postRequest = URLRequest(url: url)
        
        postRequest.httpMethod = "POST"
//        postRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//        postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let completion = {(data: Data) -> Void in
            do {
                let onlineHoroscope = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
                completionHandler(onlineHoroscope)
            }
            catch let error {
                errorHandler(error)
            }
        }
        
        NetworkHelper.manager.performDataTask(with: postRequest, completionHandler: completion, errorHandler: errorHandler)
    }

}
