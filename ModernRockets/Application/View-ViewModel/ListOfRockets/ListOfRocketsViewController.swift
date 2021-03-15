//
//  ListOfRocketsViewController.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 11.03.2021.
//

import UIKit
import SnapKit

class ListOfRocketsViewController: UIViewController {
    
    private let tableView = UITableView()
    private let label = UILabel()
    private let imageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        arrangeSubviews()
        layout()
        setUpNavigationBar()
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
        
        label.text = "Rockets Label"
        label.numberOfLines = 0
    }
    
    // func for Setup navigation bar
    private func setUpNavigationBar() {
        title = "Modern Rockets"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(test))
    }
    
    // just for test Fetch data
    @objc func test() {
        print("Fetching JSON data")
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

extension ListOfRocketsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RocketsTableViewCell", for: indexPath) as? RocketsTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = label.text
        cell.imageView?.image = imageView.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(DetailOfRocketsVC(), animated: true)
    }
    
}
