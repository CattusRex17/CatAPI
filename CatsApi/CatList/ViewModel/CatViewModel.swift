//
//  CatViewModel.swift
//  CatsApi
//
//  Created by Mauricio Rodriguez on 6/2/2025.
//

import Foundation


class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var currentPage = 0
    
    func fetchCats() {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        CatAPIService.shared.fetchCats(page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let cats):
                    self?.cats.append(contentsOf: cats)
                    self?.currentPage += 1
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
