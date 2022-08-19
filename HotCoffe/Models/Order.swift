//
//  Order.swift
//  HotCoffe
//
//  Created by Mary Moreira on 04/08/2022.
//

import Foundation

enum CoffeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case expressino
    case cortado
}

enum CoffeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeType
    let size: CoffeSize
}

extension Order {
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else { fatalError("URL is incorrect!")}
        return Resource<[Order]>(url: url)
    }()
    
    static func create(_ viewModel: AddCoffeOrderViewModel) -> Resource<Order?> {
        let order = Order(viewModel)
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else { fatalError("URL is incorrect!")}
        
        guard let data = try? JSONEncoder().encode(order) else { fatalError( "Error encoding data! ")}
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = .post
        resource.body = data
        return resource
        
    }
}

extension Order {
    
    init?(_ viewModel: AddCoffeOrderViewModel) {
        guard let name = viewModel.name, let email = viewModel.email, let selectedType = CoffeType(rawValue: viewModel.selectedType?.lowercased() ?? "latte"), let selectedSize = CoffeSize(rawValue: viewModel.selectedSize?.lowercased() ?? "small") else { return nil }
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
