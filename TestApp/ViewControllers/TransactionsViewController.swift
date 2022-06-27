//
//  TransActionsViewController.swift
//  TestApp
//
//  Created by Ali Jafarov on 25.06.22.
//

import UIKit

class TransactionsViewController: UIViewController {
    var category:String?
    var totalAmount: Double!
    var rectangleView: UIView!
    var tableView: UITableView!
    var transactions: [Transaction] = []
    
    var transActionCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    var transActionCategoryAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewDidLoad()
        configureLabels()
        configureRectangleView()
        configureTableView()
    }
    
    private func configureViewDidLoad(){
        transActionCategoryLabel.text = category
        transActionCategoryAmount.text = String(describing: totalAmount!)
        view.backgroundColor = .systemBackground
    }
    
    
    private func configureLabels(){
        view.addSubview(transActionCategoryLabel)
        view.addSubview(transActionCategoryAmount)
        
        transActionCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        transActionCategoryAmount.translatesAutoresizingMaskIntoConstraints = false
        
        transActionCategoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        transActionCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        
        transActionCategoryAmount.topAnchor.constraint(equalTo: transActionCategoryLabel.bottomAnchor, constant: 20).isActive = true
        transActionCategoryAmount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    private func configureRectangleView() {
        rectangleView = UIView()
        view.addSubview(rectangleView)
        rectangleView.layer.cornerRadius = 15
        rectangleView.backgroundColor = .secondarySystemBackground
        rectangleView.translatesAutoresizingMaskIntoConstraints = false
        
        rectangleView.topAnchor.constraint(equalTo: transActionCategoryAmount.bottomAnchor, constant: 30).isActive = true
        rectangleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        rectangleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        rectangleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rectangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func configureTableView() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.reuseID)
        
        tableView.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: TableView Delegate

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.reuseID, for: indexPath) as! TransactionTableViewCell
        cell.set(data: transactions[indexPath.row])
        return cell
    }
    
}
