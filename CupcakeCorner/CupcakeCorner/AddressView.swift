//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Quellon Naicker on 10/28/24.
//

import Foundation
import SwiftUI


struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            Section{
                NavigationLink("Check out"){
                    CheckoutView(order: order)
                }
              
                .disabled(order.hasValidAddress == false)
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func checkWhite() async{
        if order.streetAddress.isEmpty{
            print("address empty")
            return
        }
    }
}

#Preview {
    AddressView(order: Order())
}
