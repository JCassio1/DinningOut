//
//  CheckoutView.swift
//  DinningOut
//
//  Created by MR.Robot 💀 on 10/03/2021.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    @State private var paymentMethod = "Cash" //default
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 10
    @State private var showPaymentAlert = false
    
    
    let paymentMethods = ["Cash", "Credit Card", "Apple Pay", "Dinning Points"]
    let amountToTip = [0, 5, 10, 15, 20, 25]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "£0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How would you like to pay?", selection: $paymentMethod) {
                    ForEach(paymentMethods, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add dinner loyalty number", isOn: $addLoyaltyDetails)
                
                if addLoyaltyDetails {
                    TextField("Please insert your dinner number", text: $loyaltyNumber  )
                }
            }
            
            Section(header: Text("Would you like to tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(amountToTip, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Order Total: \(totalPrice )")) {
                Button("Confirm Order") {
                    showPaymentAlert.toggle()
                    //Connection with server goes here
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showPaymentAlert) {
            Alert(title: Text("Vuppt! Order confirmed"), message: Text("Order total: £\(totalPrice)"), dismissButton: .default(Text("OK")))
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
