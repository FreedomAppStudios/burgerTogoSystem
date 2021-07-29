//
//  models.swift
//  burger to go
//
//  Created by Other user on 7/29/21.
//

import Foundation

struct OrderData: Hashable {
    let name: String
    let stuff: String
    let time: String
}
class completedOrders {
    var orders = [String]()
}
var grandList = completedOrders()
