//
//  ItemRow.swift
//  DinningOut
//
//  Created by MR.Robot 💀 on 07/03/2021.
//

import SwiftUI

struct ItemRow: View {
    
    let item : MenuItem
    
    var body: some View {
        Text(item.name)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        //Use example from Menu Model
        ItemRow(item: MenuItem.example)
    }
}
