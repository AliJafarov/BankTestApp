//
//  CategoriTableUiView.swift
//  TestApp
//
//  Created by Ali Jafarov on 24.06.22.
//

import UIKit
import Charts

protocol CardDetailDelegate {
    func updateCard(card: Card)
}

class CardDetailViewController: UIViewController {
    var card: Card!
    var categories: [String:Double] = [:]
    var categoriesArray: [String] = []
    var tableview  = UITableView()
    
    var categoryColors : [String: UIColor] = [
        "HEALTH": UIColor(hexString: "#5AC461"),
        "TRANSPORT": UIColor(hexString: "#FAA61A"),
        "RETAIL": UIColor(hexString: "#E1325A")
    ]
    private var cardDetailHeader: CardDetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reuseID)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.frame = view.bounds
        cardDetailHeader = CardDetailView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 350))
        tableview.tableHeaderView = cardDetailHeader
    }
}

// MARK: TableViewDelegate

extension CardDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Categories"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseID, for: indexPath) as! CategoryTableViewCell
        let categoryName = categoriesArray[indexPath.row]
        cell.categoryImage.image = UIImage(named: categoryName)
        cell.categoryLabel.text = categoryName
        cell.categoryPrice.text = String(describing: categories[categoryName]!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let vc =  TransactionsViewController()
        let categoryName = categoriesArray[indexPath.row]
        vc.category = categoryName
        vc.totalAmount = categories[categoryName]
        vc.transactions = card.transactions.filter {
            $0.category.stringValue == categoryName
        }
        
        present(vc, animated: true, completion: nil)
    }
}

// MARK: Custom Delegate

extension CardDetailViewController: CardDetailDelegate {
    
    func updateCard(card: Card) {
        self.card = card
        categories.removeAll()
        cardDetailHeader?.pieView.chartDescription.enabled = false
        cardDetailHeader?.cashbackLabel.text = card.cashback
        cardDetailHeader?.expenceLabel.text = card.expence
        cardDetailHeader?.incomeLabel.text = card.income
        
        for transaction in card.transactions {
            let categoryName = transaction.category.stringValue
            self.categories[categoryName] = (self.categories[categoryName] ?? 0 ) + transaction.amount
        }
        
        categoriesArray = Array(categories.keys)
        var entries: [PieChartDataEntry] = []
        var colors: [UIColor] = []
        
        for n in categoriesArray {
            entries.append(PieChartDataEntry(value: self.categories[n] ?? 0, label: n))
            colors.append(categoryColors[n] ?? UIColor(cgColor: UIColor.white.cgColor))
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.sliceSpace = 2.5
        dataSet.colors = colors
        cardDetailHeader?.pieView.data = PieChartData(dataSet: dataSet)
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}
