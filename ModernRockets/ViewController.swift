//
//  ViewController.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 11.03.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    lazy var rocketView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .purple
       return view
    }()

}
