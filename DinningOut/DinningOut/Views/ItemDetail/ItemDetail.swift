//
//  ItemDetail.swift
//  DinningOut
//
//  Created by MR.Robot 💀 on 09/03/2021.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    let item: MenuItem
    
    var body: some View {
        VStack {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            
            Text(item.description)
                .padding()
            
            Button("Add to order") {
                order.add(item: item)
            }
            .frame(width: 150, height: 50)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
