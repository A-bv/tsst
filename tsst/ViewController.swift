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
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a DatePicker
        let datePicker: UIDatePicker = UIDatePicker()
        
        // Posiiton date picket within a view
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        
        // Set some of UIDatePicker properties
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        
        // Add an event to call onDidChangeDate function when value is changed.
        datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged(_:)), for: .valueChanged)
   
        // Add DataPicker to the view
        self.view.addSubview(datePicker)
        
    }
    
    var stampDateComponents = Calendar.current.dateComponents([.day, .year, .month], from: Date())
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        
        // Apply date format
        let selectedDate0: String = dateFormatter.string(from: Date())
        let selectedDate1: String = dateFormatter.string(from: sender.date)
        
        print("Previous value \(selectedDate0)")
        print("Selected value \(selectedDate1)")
        
        let dateComponents = Calendar.current.dateComponents([.day, .year, .month], from: sender.date)
        
        let dayCh = dateComponents.day != stampDateComponents.day ? true : false
        let monthCh = dateComponents.month != stampDateComponents.month ? true : false
        let yearCh = dateComponents.year != stampDateComponents.year ? true : false
        
        //Will have to add stamp date i think
        if monthCh || yearCh {
            if dayCh {
                print("collapse internal")
            }
        } else if (monthCh || yearCh) && !dayCh {
            print("collapse")
        } else {
            print("other: collapse")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

