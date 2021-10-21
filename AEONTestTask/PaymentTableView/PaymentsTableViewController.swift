//
//  PaymentsTableViewController.swift
//  AEONTestTask
//
//  Created by Кирилл Тарасов on 21.10.2021.
//

import UIKit

class PaymentsTableViewController: UITableViewController {
    
    // MARK: - Public Priperties
    var token: String?
    
    // MARK: - Private Properties
    private let apiManager = AEONManager()
    private var paymentsArray = [Response]()
       
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "PaymentsViewCell", bundle: nil), forCellReuseIdentifier: "PaymentsCell")
        getPayments()
        setupLayout()
        setupNavigationBar()
    }
    
    // MARK: - Private Methods
    private func getPayments() {
        guard let token = token else { return }
        apiManager.getPayments(token: token) { [weak self] (result) in
            
            switch result {
            case .success(let payments):
                self?.paymentsArray = payments.response
                    .filter ({$0.currency != nil &&
                                $0.currency != "" })
                
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupNavigationBar() {
        let barButton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOutPressed))
        navigationItem.setRightBarButton(barButton, animated: true)
    }
    
    private func setupLayout() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    @objc private func logOutPressed() {
        token = nil
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentsCell", for: indexPath) as! PaymentsViewCell

        let payment = paymentsArray[indexPath.row]
        cell.createCell(payment: payment)

        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
