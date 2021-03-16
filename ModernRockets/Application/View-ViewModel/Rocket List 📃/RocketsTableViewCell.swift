//
//  RocketsTableViewCell.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 11.03.2021.
//

import UIKit
import SnapKit

class RocketsTableViewCell: UITableViewCell {

    private let titleLabel =  UILabel()
    private let rocketImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        arrangeSubviews()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp(with rocket: Rocket) {
        titleLabel.text = rocket.rocketName
        rocketImageView.af.setImage(withURL: URL(string: rocket.flickrImages[1])!)
    }

    private func setUp() {
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .white
        rocketImageView.contentMode = .scaleAspectFill
        rocketImageView.layer.cornerRadius = 40
        rocketImageView.clipsToBounds = true
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }

    private func arrangeSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(rocketImageView)
    }

    private func layout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.top.greaterThanOrEqualToSuperview().offset(16)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }

        rocketImageView.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.leading.equalTo(titleLabel.snp.trailing).offset(16)
            make.top.greaterThanOrEqualToSuperview().offset(16)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
