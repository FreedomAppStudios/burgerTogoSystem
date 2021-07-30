//
//  ItemsInOrderView.swift
//  burger to go
//
//  Created by Other user on 7/26/21.
//

import SwiftUI

struct ItemsInOrderView: View {
    let name: String
    let order: String
    @State var color = Color.primary
    var body: some View {
        VStack {
                Text(name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(color)
                    .onAppear(perform: {
                        UIApplication.shared.isIdleTimerDisabled = true
                        for i in grandList.orders {
                            let isEqual = i == name
                            if isEqual == true{
                                color = Color.green
                            }
                        }
                    })
            Text("Order")
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(color)
            ScrollView {
            Text(order)
                .font(.title)
                .italic()
                .padding()
                .foregroundColor(color)
            }
            Spacer()
            Button(action: {
                //playSound()
                color = Color.green
                grandList.orders.append(name)
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 300, height: 100, alignment: .center)
                    Text("Confirm Order")
                        .foregroundColor(Color.white)
                    
                }
                
            })
            Spacer()
        }
    }
}
struct ItemsInOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsInOrderView(name: "Nick", order: "tot")
    }
}
