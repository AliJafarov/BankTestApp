//
//  CategoryHeaderView.swift
//  TestApp
//
//  Created by Ali Jafarov on 25.06.22.
//

import UIKit
import Charts

class CardDetailView: UIView {
    
    let stackView   = UIStackView()
    let expencesStackView = UIStackView()
    let incomingStackView = UIStackView()
    let cashbackStackView = UIStackView()
    let pieView = PieChartView()
    
    var expence: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .orange
        return label
    }()
    
    
    var income: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .orange
        return label
    }()
    
    var cashback: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .orange
        return label
    }()
    
    var expenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var incomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var cashbackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setExpenceStack()
        setIncomeStack()
        setCashBackStack()
        
        expence.text = "Expences"
        income.text = "Incomes"
        cashback.text = "Cashback"
        setStackView()
        setPieView()
        
    }

    
    private func setStackView(){
        
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 40
        
        stackView.addArrangedSubview(expencesStackView)
        stackView.addArrangedSubview(incomingStackView)
        stackView.addArrangedSubview(cashbackStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        
    }
    
    private func setExpenceStack() {
        
        expencesStackView.axis  = NSLayoutConstraint.Axis.vertical
        expencesStackView.distribution  = UIStackView.Distribution.equalSpacing
        expencesStackView.alignment = UIStackView.Alignment.center
        expencesStackView.spacing = 7
        
        expencesStackView.addArrangedSubview(expenceLabel)
        expencesStackView.addArrangedSubview(expence)
        expencesStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(expencesStackView)
        
    }
    
    private func setIncomeStack() {
        
        incomingStackView.axis  = NSLayoutConstraint.Axis.vertical
        incomingStackView.distribution  = UIStackView.Distribution.equalSpacing
        incomingStackView.alignment = UIStackView.Alignment.center
        incomingStackView.spacing = 7
        
        incomingStackView.addArrangedSubview(incomeLabel)
        incomingStackView.addArrangedSubview(income)
        incomingStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(incomingStackView)
        
    }
    
    private func setCashBackStack() {
        
        cashbackStackView.axis  = NSLayoutConstraint.Axis.vertical
        cashbackStackView.distribution  = UIStackView.Distribution.equalSpacing
        cashbackStackView.alignment = UIStackView.Alignment.center
        cashbackStackView.spacing = 7
        
        cashbackStackView.addArrangedSubview(cashbackLabel)
        cashbackStackView.addArrangedSubview(cashback)
        cashbackStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cashbackStackView)
        
    }
    
    private func setPieView(){
        
        self.addSubview(pieView)
        pieView.translatesAutoresizingMaskIntoConstraints = false
        pieView.chartDescription.enabled = false
        pieView.drawHoleEnabled = true
        pieView.rotationAngle = 0
        pieView.rotationEnabled = false
        pieView.isUserInteractionEnabled = false
        pieView.holeRadiusPercent = 0.5
        
    
      
        
        
        pieView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5).isActive = true
        pieView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        pieView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pieView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pieView.legend.enabled = false
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
