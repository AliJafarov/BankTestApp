//
//  CategoryTableViewCell.swift
//  TestApp
//
//  Created by Ali Jafarov on 24.06.22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let reuseID = "CategoryCell"
    
    let categoryLabel = UILabel()
    let categoryPrice = UILabel()
    let categoryImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        
        contentView.addSubview(categoryLabel)
        contentView.addSubview(categoryPrice)
        contentView.addSubview(categoryImage)
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryPrice.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        
        categoryImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        categoryImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        categoryImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        categoryImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        categoryLabel.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor, constant: 15).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        categoryPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        categoryPrice.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
}
