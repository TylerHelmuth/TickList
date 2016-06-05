//
//  AddTickViewController.swift
//  TickList
//
//  Created by Tyler on 6/4/16.
//  Copyright © 2016 tyler.miamioh.com. All rights reserved.
//

import UIKit

class AddTickViewController: UIViewController {
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
        
        gradePickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
    }
    @IBAction func save(sender: UIBarButtonItem) {
    }
}
