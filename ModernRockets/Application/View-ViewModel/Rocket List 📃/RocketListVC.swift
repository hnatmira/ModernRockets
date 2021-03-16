//
//  RocketListVC.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 11.03.2021.
//

import UIKit
import SnapKit
import AlamofireImage

class RocketListVC: UIViewController {

    private let tableView = UITableView()
    private let label = UILabel()
    private let imageView = UIImageView()
    private let viewModel = RocketListVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        arrangeSubviews()
        layout()
        setUpNavigationBar()
        viewModel.fetchData(callback: { [weak self] in
            self?.tableView.reloadData()
        })
    }

    private func setupUI() {

        tableView.register(RocketsTableViewCell.self, forCellReuseIdentifier: "RocketsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = UIColor(
            displayP3Red: 0.04578196336,
            green: 0.05871117837,
            blue: 0.2002516868,
            alpha: 0.7420529735
        )

        label.numberOfLines = 0
    }

    private func setUpNavigationBar() {
        title = "Modern Rockets"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(fetchRockets)
        )
    }

    @objc func fetchRockets() {
        viewModel.fetchData(callback: { [weak self] in
            self?.tableView.reloadData()
        })
    }
    private func arrangeSubviews() {

        view.addSubview(tableView)
    }
    private func layout() {

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension RocketListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rockets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RocketsTableViewCell",
                for: indexPath
        ) as? RocketsTableViewCell else {
            return UITableViewCell()
        }
        let rocket = viewModel.rockets[indexPath.row]
        cell.setUp(with: rocket)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let rocket = viewModel.rockets[indexPath.row]
        let viewController = RocketDetailVC(viewModel: RocketDetailVM(rocket: rocket))
        navigationController?.pushViewController(viewController, animated: true)
    }
}
