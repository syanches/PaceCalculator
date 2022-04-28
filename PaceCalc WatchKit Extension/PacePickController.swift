//
//  PacePickController.swift
//  PaceCalc
//
//  Created by Artem Martirosyan on 24.04.2022.
//  Copyright © 2022 Артем Мартиросян. All rights reserved.
//

import WatchKit
import Foundation

class PacePickController: WKInterfaceController {
    @IBOutlet var picker: WKInterfacePicker!
    @IBOutlet var button: WKInterfaceButton!
    
    @IBAction func pickerValueChanged(value: Int) {
        switch value {
        case 0:
            pace = 3.5
        case 1:
            pace = 3.75
        case 2:
            pace = 4.0
        case 3:
            pace = 4.25
        case 4:
            pace = 4.5
        case 5:
            pace = 4.75
        case 6:
            pace = 5.0
        case 7:
            pace = 5.25
        case 8:
            pace = 5.5
        case 9:
            pace = 5.75
        case 10:
            pace = 6.0
        default:
            pace = 6.0
        }
    }
    
    var pace: Double = 6
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        configureUI()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return pace
    }
}

extension PacePickController {
    private func configureUI() {
        setTitle("Choose pace")
        
        let item = WKPickerItem()
        item.title = "3:30"
        item.caption = "Pace"
        let item0 = WKPickerItem()
        item0.title = "3:45"
        item0.caption = "Pace"
        let item1 = WKPickerItem()
        item1.title = "4:00"
        item1.caption = "Pace"
        let item2 = WKPickerItem()
        item2.title = "4:15"
        item2.caption = "Pace"
        let item3 = WKPickerItem()
        item3.title = "4:30"
        item3.caption = "Pace"
        let item4 = WKPickerItem()
        item4.title = "4:45"
        item4.caption = "Pace"
        let item5 = WKPickerItem()
        item5.title = "5:00"
        item5.caption = "Pace"
        let item6 = WKPickerItem()
        item6.title = "5:15"
        item6.caption = "Pace"
        let item7 = WKPickerItem()
        item7.title = "5:30"
        item7.caption = "Pace"
        let item8 = WKPickerItem()
        item8.title = "5:45"
        item8.caption = "Pace"
        let item9 = WKPickerItem()
        item9.title = "6:00"
        item9.caption = "Pace"
        
        picker.setItems([item,item0,item1,item2,item3,item4,item5,item6,item7,item8,item9])
    }
}
