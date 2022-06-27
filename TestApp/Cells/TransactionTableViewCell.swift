//
//  TransActionTableViewCell.swift
//  TestApp
//
//  Created by Ali Jafarov on 25.06.22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    static let reuseID = "TransactionCell"
    
    let brandLabel = UILabel()
    let costPriceLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        
        contentView.addSubview(brandLabel)
        contentView.addSubview(costPriceLabel)
        contentView.addSubview(dateLabel)
        
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        costPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        brandLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        brandLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        costPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        costPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        dateLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 15).isActive = true
        
    }
    
    func set (data: Transaction) {
        brandLabel.text = data.name
        dateLabel.text = data.dateTime
        costPriceLabel.text = "\(data.amount)"
    }
}
