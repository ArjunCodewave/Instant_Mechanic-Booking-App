//
//  ProductViewModel.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 02/09/26.
//

import Foundation
import Foundation
import Combine

@MainActor
class ProductViewModel: ObservableObject {
    
    @Published var products = [Task]()
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var searchText = ""
    
    private let service = ProductDataService()
    
    init() {
        fetchProducts()
    }
    var filteredProducts: [Task] {
            
            if searchText.isEmpty {
                return products
            }
            
            return products.filter { product in
                product.name?
                    .localizedCaseInsensitiveContains(searchText) == true
            }
        }
    
    func fetchProducts() {
        
        isLoading = true
        errorMessage = nil
        
        service.fetchProducts { [weak self] result in
            
            switch result {
                
            case .success(let products):
                self?.products = products
                self?.isLoading = false
                
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
}
