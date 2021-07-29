//
//  burger_to_goApp.swift
//  burger to go
//
//  Created by Other user on 7/26/21.
//

import SwiftUI
import Firebase
@main
struct burger_to_goApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            OrderListView()
        }
    }
}
//@main
//struct Example_ProjectApp: App {
//    // MARK: - Life Cycle
//    init() {
//        FirebaseApp.configure()
//    }
//
//    // MARK: - UI Elements
//    var body: some Scene {
//        WindowGroup {
//            MainScreen()
//        }
//    }
//}
