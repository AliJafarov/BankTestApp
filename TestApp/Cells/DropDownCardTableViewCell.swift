//
//  DropDownCardTableViewCell.swift
//  TestApp
//
//  Created by Ali Jafarov on 23.06.22.
//

import UIKit

class DropDownCardTableViewCell: UITableViewCell {
    
    static let reuseId = "DropCardCell"
    
    var cardImageView = UIImageView(frame: .zero)
    var cardname = UILabel()
    var cardNumber  = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
        contentView.addSubview(cardImageView)
        contentView.addSubview(cardname)
        contentView.addSubview(cardNumber)
        cardImageView.contentMode = .scaleAspectFill
        
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardname.translatesAutoresizingMaskIntoConstraints = false
        cardNumber.translatesAutoresizingMaskIntoConstraints = false
        
        cardImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        cardImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        cardname.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 16).isActive = true
        cardname.centerYAnchor.constraint(equalTo: cardImageView.centerYAnchor).isActive = true
        
        cardNumber.leadingAnchor.constraint(equalTo: cardname.trailingAnchor, constant: 16).isActive = true
        cardNumber.centerYAnchor.constraint(equalTo: cardImageView.centerYAnchor).isActive = true
        cardNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48).isActive = true
    }
    
    func set(cardData: Card){
        
        cardname.text = cardData.cardName
        cardNumber.text = cardData.cardNumber
        cardImageView.image = UIImage(named: cardData.cardImg)
    }
}
