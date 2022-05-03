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
        currentPace = paces[value]
    }
    
    var currentPace: Double = 6
    
    var pickerItems: [WKPickerItem] = []
    
    lazy var paces = setPaces()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        configureUI()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return currentPace
    }
}

extension PacePickController {
    private func setPaces() -> [Double] {
        var paces: [Double] = []
        for i in stride(from: 3.5, through: 6, by: 0.25) {
            paces.append(i)
        }
        return paces
    }
    
    private func paceToString(_ value: Double) -> String {
        let hours = Int(value)
        let minutesInInt = "\(Int(60*value.truncatingRemainder(dividingBy: 1)))"
        let minutes = minutesInInt != "0" ? minutesInInt : "00"
        return "\(hours):\(minutes)"
    }
    
    private func configurePaces() {
        for i in stride(from: 3.5, through: 6, by: 0.25) {
            let pace = paceToString(i)
            let item = WKPickerItem()
            item.title = pace
            item.caption = "Pace"
            pickerItems.append(item)
        }
    }
    
    private func configureUI() {
        setTitle("Choose pace")
        configurePaces()
        picker.setItems(pickerItems)
    }
}
