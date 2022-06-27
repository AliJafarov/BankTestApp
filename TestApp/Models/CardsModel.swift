//
//  CardsModel.swift
//  TestApp
//
//  Created by Ali Jafarov on 24.06.22.
//

import Foundation
import UIKit

struct Card: Codable {
    let cardNumber: String
    let cardName: String
    let cardImg: String
    let expence: String
    let income: String
    let cashback: String
    let transactions: [Transaction]
}


struct Transaction: Codable  {
    let category: Category
    let amount: Double
    let name: String
    let dateTime: String
}

enum Category: String, CodingKey, Codable {
    case HEALTH = "HEALTH"
    case RETAIL = "RETAIL"
    case TRANSPORT = "TRANSPORT"
}




