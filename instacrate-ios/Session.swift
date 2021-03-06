//
//  Session.swift
//  subber-api
//
//  Created by Hakon Hanesand on 9/28/16.
//
//

import Foundation
import Node
import RealmSwift

@objc
enum SessionType: Int {
    case customer
    case vendor
    case none

    init(from string: String) throws {
        switch string {
        case "customer":
            self = .customer
            return
        case "vendor":
            self = .vendor
            return
        case "none":
            self = .none
            return
        default:
            throw GenericError()
        }
    }
}

final class Session: Object, ObjectNodeInitializable {
    
    dynamic var id = 0
    dynamic var exists = false
    
    dynamic var accessToken = ""
    dynamic var type: SessionType = .none
    
    dynamic var customer: Customer? = nil

    var customer_id: Int?

    convenience required init(node: Node, in context: Context) throws {
        self.init()
        
        id = try node.extract("id")
        accessToken = try node.extract("accessToken")
        customer_id = try node.extract("customer_id")

        type = (try? node.extract("type") { (type: String) in
            return try SessionType(from: type)
        }) ?? .none
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func realmObject() -> Object {
        return self
    }
}
