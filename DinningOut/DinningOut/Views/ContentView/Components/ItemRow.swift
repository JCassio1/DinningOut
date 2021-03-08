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
        HStack(spacing: 20) {
            Image(item.thumbnailImage)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                Text("£ \(item.price)")
            }
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(9)
                    .background(dietaryColors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        //Use example from Menu Model
        ItemRow(item: MenuItem.example)
    }
}
