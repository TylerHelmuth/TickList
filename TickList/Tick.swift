//
//  Tick.swift
//  TickList
//
//  Created by Tyler on 6/5/16.
//  Copyright © 2016 tyler.miamioh.com. All rights reserved.
//

import Foundation
import CoreData


class Tick: NSManagedObject {
    @NSManaged var comment: String?
    @NSManaged var date: NSDate?
    @NSManaged var grade: String?
    @NSManaged var location: String?
    @NSManaged var name: String?
    @NSManaged var photo: NSData?
    @NSManaged var send: String?
    @NSManaged var sortingGrade: NSNumber?
    @NSManaged var wall: String?
    @NSManaged var rating: NSNumber?
}
