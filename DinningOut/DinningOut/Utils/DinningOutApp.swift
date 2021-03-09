//
//  DinningOutApp.swift
//  DinningOut
//
//  Created by MR.Robot 💀 on 06/03/2021.
//

import SwiftUI

@main
struct DinningOutApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
