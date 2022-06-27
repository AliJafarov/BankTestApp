//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Ali Jafarov on 24.06.22.
//

import Foundation

class HomeViewModel {
    var cardArray: [Card] = []
    
    func getData(completion: @escaping ()->()) {
        NetworkManager.shared.getData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let cards):
                self.cardArray = cards
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
