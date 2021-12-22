//
//  CompanyView.swift
//  CompaniesAndEmployees
//
//  Created by pavel on 22.12.21.
//

import UIKit

protocol ICompanyView: UIView {
    var onTouchHandler: ((IndexPath) -> Void)?  { get set }
}

final class CompanyView: UIView {
    
    var onTouchHandler: ((IndexPath) -> Void)?
    
    private var presenter: ICompanyPresenter?
    private var controller: ICompanyViewController?

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CompanyTableViewCell.self,
                                forCellReuseIdentifier: CompanyTableViewCell.id)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CompanyView {
    func configureView() {
        self.addSubview(self.tableView)
        self.setupAutoLayout()
        self.configureTableView()
    }
    
    func configureTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension CompanyView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyTableViewCell.id, for: indexPath)
        guard let companyCell = cell as? CompanyTableViewCell else { return cell }
        companyCell.nameCompanyLabel.text = "Name company \(indexPath.row)"
        
        return companyCell
    }
}

extension CompanyView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)        
        self.onTouchHandler?(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


extension CompanyView: ICompanyView {
    
}
