//
//  SettingsViewController.swift
//  HoriOScope
//
//  Created by Luis Calle on 12/11/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    
    let horoscopeNames = ["Aries", "Leo", "Sagittarius", "Taurus", "Virgo", "Capricorn", "Gemini", "Libra", "Aquarius", "Cancer", "Scorpio", "Pisces"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.nameTextField.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let newName = nameTextField.text {
            UserDefaultsHelper.manager.setName(to: newName)
        }
        let newSign = horoscopeNames[pickerView.selectedRow(inComponent: 0)]
        UserDefaultsHelper.manager.setSign(to: newSign)
    }
    
}


extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horoscopeNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return horoscopeNames[row]
    }
    
}
