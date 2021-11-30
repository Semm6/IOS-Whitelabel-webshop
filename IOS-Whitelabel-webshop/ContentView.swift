//
//  ContentView.swift
//  IOS-Whitelabel-webshop
//
//  Created by Sem de Wilde on 29/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var products = [Product]()
    
    var body: some View {
        List(products) { product in
            Text("\(product.name)")
        }
        .onAppear() {
            Api().loadData { (products) in
                self.products = products
            }
        }.navigationTitle("Product List")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
