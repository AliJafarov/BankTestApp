//
//  HomeViewController.swift
//  TestApp
//
//  Created by Ali Jafarov on 23.06.22.
//

import UIKit


class HomeViewController: UIViewController {
    
    var homeVM = HomeViewModel()
    var cardDelegate: CardDetailDelegate?
    
    var categoriesView: UIView!
    var cardView: UIView!
    var cardTableView = UITableView()
    let cardTextField = UITextField()
    var expandButtonCardView : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewDidload()
        configureCardView()
        configureCardTableView()
        configureCategoriesView()
        getData()
    }
    
    private func getData() {
        homeVM.getData {
            DispatchQueue.main.async {
                self.cardTableView.reloadData()
                self.didSelectCard(index: 1)
            }
        }
    }
    
    private func configureViewDidload(){
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureCategoriesView() {
        categoriesView = UIView()
        view.addSubview(categoriesView)
        categoriesView.backgroundColor = .systemBackground
        categoriesView.layer.cornerRadius = 17
        categoriesView.translatesAutoresizingMaskIntoConstraints = false
        
        let categoryTableView = CardDetailViewController()
        self.cardDelegate = categoryTableView
        add(childVC: categoryTableView, to: categoriesView)
        
        categoriesView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 120).isActive = true
        categoriesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        categoriesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 ).isActive = true
        categoriesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
    private func configureCardView(){
        cardView = UIView()
        view.addSubview(cardView)
        cardView.layer.cornerRadius = 10
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .systemBackground
        expandButtonCardView = UIButton()
        expandButtonCardView.addTarget(self, action: #selector(didTappedTriangleButtonCardView), for: .touchUpInside)
        cardView.addSubview(expandButtonCardView)
        expandButtonCardView.setImage(UIImage(named: "triangle"), for: .normal)
        expandButtonCardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.addSubview(cardTextField)
        cardTextField.translatesAutoresizingMaskIntoConstraints = false
        cardTextField.isUserInteractionEnabled = false
        
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        cardTextField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        cardTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        cardTextField.trailingAnchor.constraint(equalTo: expandButtonCardView.leadingAnchor, constant: -16).isActive = true
        cardTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        expandButtonCardView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16).isActive = true
        expandButtonCardView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
    }
    
    private func configureCardTableView() {
        view.addSubview(cardTableView)
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.translatesAutoresizingMaskIntoConstraints = false
        cardTableView.register(DropDownCardTableViewCell.self, forCellReuseIdentifier: DropDownCardTableViewCell.reuseId)
        
        cardTableView.layer.masksToBounds = false
        cardTableView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardTableView.layer.shadowColor = UIColor.black.cgColor
        cardTableView.layer.shadowOpacity = 0.5
        cardTableView.layer.shadowRadius = 1
        cardTableView.isHidden = true
        
        cardTableView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 5).isActive = true
        cardTableView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        cardTableView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,  constant: -48).isActive = true
        cardTableView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    
    @objc func didTappedTriangleButtonCardView() {
        UIView.animate(withDuration: 0.1) { self.cardTableView.isHidden = !self.cardTableView.isHidden
            self.expandButtonCardView.transform = self.expandButtonCardView.transform.rotated(by: +CGFloat.pi + 0.00000001)
        }
    }
    
    private func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    private func didSelectCard(index: Int) {
        self.cardDelegate?.updateCard(card: homeVM.cardArray[index])
        let image = homeVM.cardArray[index].cardImg
        cardTextField.text = "\(homeVM.cardArray[index].cardName)    \(homeVM.cardArray[index].cardNumber)"
        cardTextField.setIcon(UIImage(named: image)!)
        cardTableView.isHidden = true
    }
}



extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.cardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DropDownCardTableViewCell.reuseId, for: indexPath) as!
        DropDownCardTableViewCell
        let cards = homeVM.cardArray[indexPath.row]
        cell.set(cardData: cards)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectCard(index: indexPath.row)
    }
}
