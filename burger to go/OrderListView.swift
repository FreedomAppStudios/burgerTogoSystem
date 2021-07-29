//
//  OrderListView.swift
//  burger to go
//
//  Created by Other user on 7/26/21.
//

import SwiftUI
import Firebase
struct OrderListView: View {
    @State var orders = [OrderData]()
    @State var m = "Orders"
    let db = Firestore.firestore()
    var body: some View {
        VStack {
            NavigationView{
                VStack {
                    Text(m)
                        .font(.title)
                        .bold()
                        .onAppear(perform: {
                            
                            db.collection("z-orders")
                                .order(by: "time", descending: true)
                                .addSnapshotListener {
                                    querySnapshot, error in
                                    if let e = error {
                                        print(e)
                                        m = "Error. Failure to reach server."
                                    } else {
                                        if let snapshotDocuments = querySnapshot?.documents {
                                            orders = []
                                            for doc in snapshotDocuments {
                                                let data = doc.data()
                                                if let guestName = data["name"] as? String, let food = data["order"] as? String, let time = data["realTime"] as? String{
                                                    orders.append(OrderData(name: guestName, stuff: food, time: time))
                                                }
                                            }
                                        }
                                    }
                                }
                            
                        })
                    List(orders, id: \.self) { order in
                        HStack {
                            NavigationLink(destination: ItemsInOrderView(name: order.name, order: order.stuff)) {
                                VStack {
                                    HStack {
                                        Text(order.name)
                                            .bold()
                                        Spacer()
                                        Text(order.time)
                                    }
                                }
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    Text("Hello, today is:")
                        .font(.title)
                        .bold()
                    Text(Date(), style: .date)
                        .font(.title)
                        .bold()
                    Spacer()
                    Text("To get started open the menu on the left")
                        .font(.title)
                        .italic()
                    Spacer()
                }
                
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}



