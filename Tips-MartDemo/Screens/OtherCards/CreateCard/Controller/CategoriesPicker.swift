//
//  CategoriesPicker.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CategoriesPicker: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var returnTitle: (String) ->() = {_ in}
    let pickerData = ["Рестораны", "Кабаки", "Бордели", "Магазы", "Еще что-то", "И Еще что-то", "Какя-то хрень еще", "Хренища"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        returnTitle(pickerData[row])
    }

    
    
}
