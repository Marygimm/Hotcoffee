//
//  AddCoffeOrderViewModel.swift
//  HotCoffe
//
//  Created by Mary Moreira on 04/08/2022.
//

import Foundation

struct AddCoffeOrderViewModel {
    
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeSize.allCases.map { $0.rawValue.capitalized }
    }
}
