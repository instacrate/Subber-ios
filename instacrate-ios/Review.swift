//
//  Review.swift
//  subber-api
//
//  Created by Hakon Hanesand on 9/27/16.
//
//

import Foundation
import Node
import RealmSwift

final class Review: Object, ObjectNodeInitializable {
    
    dynamic var id = 0
    
    dynamic var text = ""
    dynamic var rating = 0
    dynamic var date = Date()
    
    dynamic var box: Box? = nil
    dynamic var customer: Customer? = nil

    dynamic var box_id: Int = 0
    dynamic var customer_id: Int = 0

    convenience required init(node: Node, in context: Context) throws {
        self.init()
        
        id = try node.extract("id")

        text = try node.extract("text")
        rating = try node.extract("rating")

        box_id = try node.extract("box_id")
        
        if let id = node["customer_id"], let cust_id = id.int {
            customer_id = cust_id
        } else if let customerNode = node["customer"] {
            customer_id = try customerNode.extract("id")
        }

        date = (try? node.extract("date") { (dateString: String) in
            try Date(ISO8601String: dateString)
        }) ?? Date()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func realmObject() -> Object {
        return self
    }
}
