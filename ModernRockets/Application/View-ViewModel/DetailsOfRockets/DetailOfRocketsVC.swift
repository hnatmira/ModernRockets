//
//  DetailOfRocketsVC.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 14.03.2021.
//

import UIKit
import SnapKit

class DetailOfRocketsVC: UIViewController {

    private let scrollView = UIScrollView()
    //private let nameOfRocket = UILabel()
    private let descriptionOfRocektsText = UILabel()
    private let rocketImage = UIImageView()
    private let textContainer = UIView()
    let viewModel = RocketListVM()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        arrangeSubviews()
        layout()
    }

    private func setUp() {
        view.backgroundColor = #colorLiteral(red: 0.04578196336, green: 0.05871117837, blue: 0.2002516868, alpha: 0.7420529735)

        scrollView.contentInsetAdjustmentBehavior = .never

        rocketImage.image = UIImage(named: "rocket_image.jpg")
        rocketImage.contentMode = .scaleAspectFill
        rocketImage.clipsToBounds = true

        descriptionOfRocektsText.textColor = .white
        descriptionOfRocektsText.numberOfLines = 0
        let text = "I am the best space ship "
        descriptionOfRocektsText.text = text + text + text
    }

    private func arrangeSubviews() {
        view.addSubview(scrollView)

        scrollView.addSubview(rocketImage)
        scrollView.addSubview(textContainer)

        textContainer.addSubview(descriptionOfRocektsText)
    }

    private func layout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        rocketImage.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(rocketImage.snp.width).multipliedBy(0.7)
        }

        textContainer.snp.makeConstraints {make in
            make.top.equalTo(rocketImage.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(scrollView)
        }

        descriptionOfRocektsText.snp.makeConstraints {make in
            make.edges.equalTo(textContainer).inset(14)
        }
    }

}
