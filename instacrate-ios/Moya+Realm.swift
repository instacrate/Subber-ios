//
//  Moya+Realm.swift
//  instacrate-ios
//
//  Created by Hakon Hanesand on 1/9/17.
//  Copyright © 2017 Instacrate. All rights reserved.
//

import Foundation
import Moya
import Result
import RealmSwift

extension Realm {
    
    static func write(block: (Realm) -> ()) {
        let realm = try! Realm()
        
        try! realm.write {
            block(realm)
        }
    }
}

extension Response {
    
    static let noModifications: (Object) -> (Object) = { object in
        return object
    }
    
    func updateRealmAsRequest(from endpoint: ResponseTargetType) throws {
        let node = try mapNode()
        let objects = try parse(node: node, from: endpoint).map { $0.realmObject() }
    
        DispatchQueue.main.async {

            Realm.write { realm in
                objects.forEach {
                    realm.add($0, update: true)
                }
            }
        }
    }
}
