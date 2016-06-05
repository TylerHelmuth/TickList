//
//  AddTickViewController.swift
//  TickList
//
//  Created by Tyler on 6/4/16.
//  Copyright © 2016 tyler.miamioh.com. All rights reserved.
//

import UIKit
import CoreData

class AddTickViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gradePickerView: UIPickerView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var wallTextField: UITextField!
    @IBOutlet weak var sendPickerView: UIPickerView!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let grades = ["5.4","5.5","5.6","5.7-", "5.7", "5.7+","5.8-", "5.8","5.8+", "5.9-", "5.9", "5.9+", "5.10-", "5.10a",
                  "5.10b", "5.10c", "5.10d", "5.10+", "5.11-", "5.11a", "5.11b", "5.11c", "5.11d", "5.11+", "5.12-",
                  "5.12a", "5.12b", "5.12c", "5.12d", "5.12+", "5.13-", "5.13a", "5.13b", "5.13c", "5.13d", "5.13+",
                  "5.14-", "5.14a", "5.14b", "5.14c", "5.14d", "5.14+", "5.15-", "5.15a", "5.15b", "5.15c"]
    let sends = ["Redpoint", "Flash", "Onsight"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradePickerView.delegate = self
        gradePickerView.dataSource = self
        sendPickerView.delegate = self
        sendPickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveTick() {
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entity =  NSEntityDescription.entityForName("Tick", inManagedObjectContext: managedObjectContext)
        
        let tick = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:  managedObjectContext)
        
        tick.setValue(commentsTextField.text, forKey: "comment");
        tick.setValue(datePickerView.date, forKey: "date");
        tick.setValue(grades[gradePickerView.selectedRowInComponent(0)], forKey: "grade");
        tick.setValue(locationTextField.text, forKey: "location")
        tick.setValue(nameTextField.text, forKey: "name")
        tick.setValue(sends[sendPickerView.selectedRowInComponent(0)], forKey: "send")
        tick.setValue(gradePickerView.selectedRowInComponent(0), forKey: "sortingGrade")
        tick.setValue(wallTextField.text, forKey: "wall")
        
        if let image = imageView.image {
            tick.setValue(UIImageJPEGRepresentation(image, 1), forKey: "photo")
        }
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    
    // MARK: - Picker delegate and data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == gradePickerView {
            return grades.count
        }
        return sends.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == gradePickerView {
            return grades[row]
        }
        return sends[row]
    }
}
