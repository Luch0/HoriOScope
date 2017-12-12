//
//  UserDefaultsHelper.swift
//  HoriOScope
//
//  Created by Luis Calle on 12/11/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct UserDefaultsHelper {
    static let manager = UserDefaultsHelper()
    private init() { }
    
    private var nameKey = "name"
    private var signKey = "sign"
    
    func getName() -> String? {
        return UserDefaults.standard.string(forKey: nameKey)
    }
    
    func getSign() -> String? {
        return UserDefaults.standard.string(forKey: signKey)
    }
    
    func setName(to newName: String) {
        UserDefaults.standard.setValue(newName, forKey: nameKey)
    }
    
    func setSign(to newSign: String) {
        UserDefaults.standard.setValue(newSign, forKey: signKey)
    }
    
}
