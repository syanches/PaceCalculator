//
//  DetailInterfaceController.swift
//  PaceCalc WatchKit Extension
//
//  Created by Артем Мартиросян on 31.05.2020.
//  Copyright © 2020 Артем Мартиросян. All rights reserved.
//

import WatchKit
import Foundation

class DetailInterfaceController: WKInterfaceController {
    @IBOutlet weak var myTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        setTitle("Your splits")
        
        if let paceTuple = context as? (Double, Double) {
            let rowCount = Int(paceTuple.0)
            let seconds = totalSeconds(for: paceTuple.0,with: paceTuple.1)
    
            self.myTable.setNumberOfRows(rowCount, withRowType: "Row")
            
            let secondsForOneKm = Int((Double(seconds) / paceTuple.0).rounded())

            for i in 0..<rowCount {
                let row = self.myTable.rowController(at: i) as! RowController
                let seconds = (i+1)*secondsForOneKm
                row.kmLabel.setText("\(i+1) km")
                row.timeLabel.setText(convertTime(fullSeconds: seconds))
            }
            
            if rowCount == 21 || rowCount == 42 {
                self.myTable.insertRows(at: IndexSet(integer: rowCount), withRowType: "Row")
                let row = self.myTable.rowController(at: rowCount) as! RowController
                row.kmLabel.setText("Finish")
                row.timeLabel.setText(convertTime(fullSeconds: seconds))
            }
            
        }
    }
    
    private func totalSeconds(for distance: Double, with pace: Double) -> Int {
        return Int(distance*pace*60)
    }
    
    private func convertTime(fullSeconds: Int) -> String {
        let hours = fullSeconds / 3600
        let minutes = (fullSeconds % 3600) / 60
        let seconds = (fullSeconds % 3600) % 60
        
        let dateString = "\(hours):\(minutes):\(seconds)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        if let dateObj = dateFormatter.date(from: dateString) {
            
            dateFormatter.dateFormat = hours > 0 ? "HH:mm:ss" : "mm:ss"
            let string = dateFormatter.string(from: dateObj)
            return string
        }
        return ""
    }
}
