//
//  NavigationVC.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 08.03.2022.
//

import UIKit

class NavigationVC: BaseViewController {
    
    private lazy var welcomeLbl: UILabel  = {
        let lbl = UILabel()
        lbl.text = "WELCOME"
        lbl.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NavigationVC"
        view.backgroundColor = .white
        showSeparatorNavigation = true
    }
    
    override func initUI() {
        view.addSubview(welcomeLbl)
    }
    
    override func initConstraints() {
        NSLayoutConstraint.activate([
            
            welcomeLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            welcomeLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
