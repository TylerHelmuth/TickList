//
//  Tick.swift
//  TickList
//
//  Created by Tyler on 5/29/16.
//  Copyright © 2016 tyler.miamioh.com. All rights reserved.
//

import Foundation
import CoreData


class Tick: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var grade: String?
    @NSManaged var date: NSDate?
    @NSManaged var location: String?
    @NSManaged var wall: String?
    @NSManaged var send: String?
    @NSManaged var comment: String?
    @NSManaged var sortingGrade: NSNumber?
    @NSManaged var photo: NSData?
}
