//
//  ViewController.swift
//  tsst
//
//  Created by Alexandre Bevilacqua on 28/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datePicker: UIDatePicker = UIDatePicker()
        
        // Posiiton date picket within a view
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        
        // UIDatePicker properties
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        
        // Add an event to call onDidChangeDate function when value is changed.
        datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged(_:)), for: .valueChanged)
   
        // Add DataPicker to the view
        self.view.addSubview(datePicker)
        
    }
    
    var okToCollapse = false
    var stampDateComponents = DateComponents()
    var dateComponents = DateComponents()
    var stampDate = Date() {
        willSet {
            stampDateComponents = Calendar.current.dateComponents([.day, .year, .month], from: stampDate)
        }
        didSet {
            dateComponents = Calendar.current.dateComponents([.day, .year, .month], from: stampDate)
        }
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        // Show dates
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let selectedDate0: String = dateFormatter.string(from: stampDate)
        let selectedDate1: String = dateFormatter.string(from: sender.date)
        print("Previous value \(selectedDate0)")
        print("Selected value \(selectedDate1)")
        
        stampDate = sender.date
        
        let dayCh = dateComponents.day != stampDateComponents.day ? true : false
        let monthCh = dateComponents.month != stampDateComponents.month ? true : false
        let yearCh = dateComponents.year != stampDateComponents.year ? true : false
        
        if dayCh {
            print("collapse")
        } else if !dayCh && (monthCh || yearCh){
            okToCollapse = true
            print("next selection will collapse")
        } else if okToCollapse {
            print("collapse internal")
            okToCollapse = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

