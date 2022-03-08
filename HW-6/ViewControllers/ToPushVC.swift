//
//  ToPushVC.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 08.03.2022.
//

import UIKit

class ToPushVC: BaseViewController {
    
    lazy private var btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.cornerRadius = 4
        btn.setTitle("Push", for: .normal)
        btn.backgroundColor = .blue
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(pushBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        title = "Push View Controller"
        showSeparatorNavigation = true
    }
    
    override func initUI() {
        view.addSubview(btn)
    }
    
    override func initConstraints() {
        NSLayoutConstraint.activate([
            
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn.widthAnchor.constraint(equalToConstant: 100),
            btn.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc
    func pushBtnTapped() {
        let vc = ViewController()
        self.navController?.pushViewController(vc, animated: true)
    }
}
