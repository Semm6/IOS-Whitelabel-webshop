//
//  Product.swift
//  IOS-Whitelabel-webshop
//
//  Created by Sem de Wilde on 30/11/2021.
//

import Foundation

struct Product: Codable, Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var price: String
    var image: String
}
    
class Api : ObservableObject{
    @Published var products = [Product]()
    
    func loadData(completion:@escaping ([Product]) -> ()) {
        guard let url = URL(string: "http://localhost:8085/api/products") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let products = try! JSONDecoder().decode([Product].self, from: data!)
            print(products)
            DispatchQueue.main.async {
                completion(products)
            }
        }.resume()
    }
}



