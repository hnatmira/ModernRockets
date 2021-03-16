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
    let viewModel = RocketListVM()

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

        //register cell
        tableView.register(RocketsTableViewCell.self, forCellReuseIdentifier: "RocketsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        //tableView.backgroundView = UIImageView(image: UIImage(named: "background_rocket.png"))

        imageView.image = UIImage(named: "rocket_image.jpg")
        //label.text = "Rockets Label"
        label.numberOfLines = 0
    }
    // func for Setup navigation bar
    private func setUpNavigationBar() {
        title = "Modern Rockets"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(
            barButtonSystemItem: .add,
            target: nil,
            action: nil
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(test)
        )
    }

    // just for test Fetch data
    @objc func test() {
        print("Fetching JSON data")
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
        cell.textLabel?.text = rocket.rocketName
        //cell.imageView?.af.setImage(withURL: URL(string: rocket.flickrImages[0])!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(DetailOfRocketsVC(), animated: true)
    }
}
