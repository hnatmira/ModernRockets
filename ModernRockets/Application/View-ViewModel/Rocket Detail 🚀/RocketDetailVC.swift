//
//  RocketDetailVC.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 14.03.2021.
//

import UIKit
import SnapKit
import AlamofireImage

class RocketDetailVC: UIViewController {

    private let scrollView = UIScrollView()
    //private let nameOfRocket = UILabel()
    private let descriptionOfRocektsText = UILabel()
    private let rocketImage = UIImageView()
    private let textContainer = UIView()
    private let viewModel: RocketDetailVM

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    init(viewModel: RocketDetailVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        arrangeSubviews()
        layout()
    }

    private func setUp() {
        view.backgroundColor = UIColor(
            displayP3Red: 0.04578196336,
            green: 0.05871117837,
            blue: 0.2002516868,
            alpha: 0.7420529735
        )

        scrollView.contentInsetAdjustmentBehavior = .never

        rocketImage.af.setImage(withURL: URL(string: viewModel.rocket.flickrImages[0])!)
        rocketImage.contentMode = .scaleAspectFill
        rocketImage.clipsToBounds = true

        descriptionOfRocektsText.textColor = .white
        descriptionOfRocektsText.numberOfLines = 0
        descriptionOfRocektsText.text = viewModel.rocket.description

    }

    private func arrangeSubviews() {
        view.addSubview(scrollView)

        scrollView.addSubview(rocketImage)
        scrollView.addSubview(textContainer)

        textContainer.addSubview(descriptionOfRocektsText)
    }

    private func layout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        rocketImage.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(rocketImage.snp.width).multipliedBy(0.7)
        }

        textContainer.snp.makeConstraints {make in
            make.top.equalTo(rocketImage.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(scrollView)
        }

        descriptionOfRocektsText.snp.makeConstraints {make in
            make.edges.equalTo(textContainer).inset(14)
        }
    }
}
