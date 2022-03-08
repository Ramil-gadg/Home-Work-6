//
//  ViewController.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 07.03.2022.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        title = "Just View Controller"
        showSeparatorNavigation = true
    }

}

