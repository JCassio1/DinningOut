//
//  MainView.swift
//  DinningOut
//
//  Created by MR.Robot 💀 on 09/03/2021.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Label("Menu", systemImage: "list.dash") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "filemenu.and.selection") }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
        
    }
}
