//
//  HomeViewController.swift
//  HoriOScope
//
//  Created by Luis Calle on 12/11/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var horoscopeRes: HoroscopeResponse?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var yesterdayButton: UIButton!
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var tomorrowButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.isHidden = true
        self.yesterdayButton.isHidden = true
        self.todayButton.isHidden = true
        self.tomorrowButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let name = UserDefaultsHelper.manager.getName(),
              let _ = UserDefaultsHelper.manager.getSign() else { return }
        self.nameLabel.text = "Hello \(name)!"
        self.nameLabel.isHidden = false
        self.yesterdayButton.isHidden = false
        self.todayButton.isHidden = false
        self.tomorrowButton.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.textView.text = ""
    }
    
    @IBAction func dayButtonPressed(_ sender: UIButton) {
        guard let sign = UserDefaultsHelper.manager.getSign() else { return }
        let day: String
        switch sender.tag {
        case 0:
            day = "yesterday"
        case 1:
            day = "today"
        case 2:
            day = "tomorrow"
        default:
            day = "today"
        }
        let horoscope = HoroscopePost(sign: sign, day: day)
        let completion: (HoroscopeResponse) -> Void = { (onlineHoroscope: HoroscopeResponse) in
            self.horoscopeRes = onlineHoroscope
            self.textView.text = onlineHoroscope.description
        }
        HoroscopeAPIClient.manager.post(horoscopePost: horoscope, completionHandler: completion ,errorHandler: {print($0)})
    }

}
