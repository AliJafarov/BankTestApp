//
//  DropDownCell.swift
//  TestApp
//
//  Created by Ali Jafarov on 23.06.22.
//

import UIKit

class DropDownCell: UITableViewCell {
    
    static let reuseID = "DropCell"
    
    
    var cellFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .semibold)

  

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: style , reuseIdentifier: reuseIdentifier)
           
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    func configureCell(with title: String) {
           self.selectionStyle = .none
           self.textLabel?.font = cellFont
           self.textLabel?.textColor = self.lightColor
           self.backgroundColor = UIColor.clear
           self.textLabel?.text = title
       }

}
