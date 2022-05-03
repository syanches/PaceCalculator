//
//  InterfaceController.swift
//  PaceCalc WatchKit Extension
//
//  Created by Артем Мартиросян on 31.05.2020.
//  Copyright © 2020 Артем Мартиросян. All rights reserved.
//

import WatchKit
import Foundation

class RacePickController: WKInterfaceController {
    var pace: Double = 6

    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        switch segueIdentifier {
        case "Segue5K":
            return (5.0, pace)
        case "Segue10K":
            return (10.0, pace)
        case "Segue21.1K":
            return (21.1, pace)
        case "Segue42.2K":
            return (42.2, pace)
        default:
            return nil
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let pace = context as? Double {
            setTitle("Choose race")
            self.pace = pace
        }
    }
}
