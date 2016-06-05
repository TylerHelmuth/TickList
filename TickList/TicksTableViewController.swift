//
//  DataViewController.swift
//  TickList
//
//  Created by Tyler on 5/27/16.
//  Copyright © 2016 tyler.miamioh.com. All rights reserved.
//

import UIKit
import CoreData
class TicksTableViewController: UITableViewController {
    var ticks = [Tick]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ticks = loadTicks()
    }
    
    func loadTicks() -> [Tick] {
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Tick")
        
        do {
            return try managedContext.executeFetchRequest(fetchRequest) as! [Tick]
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tickCell", forIndexPath: indexPath) as! TickTableViewCell
        let tick = ticks[indexPath.row]
        
        cell.name.text = tick.name
        return cell
    }
    
    @IBAction func addTick(sender: UIBarButtonItem) {
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Tick", inManagedObjectContext: managedContext) as! Tick
        entity.setValue("Ro Shampo", forKey: "name")
        do {
            try managedContext.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    @IBAction func recordSaved(segue:UIStoryboardSegue) {
        let controller = segue.sourceViewController as! AddTickViewController
        controller.saveTick()
        ticks = loadTicks()
        tableView.reloadData()
    }
}

