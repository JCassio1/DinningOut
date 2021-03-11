//
//  OrderView.swift
//  DinningOut
//
//  Created by MR.Robot 💀 on 09/03/2021.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    func deleteItem(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("£ \(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                
                Section {
                    NavigationLink (
                        destination: CheckoutView(),
                        label: {
                            Text("Place Order")
                        })
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("My Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar{
                EditButton()
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
