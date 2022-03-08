//
//  XibVC.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 08.03.2022.
//

import UIKit

class XibVC: BaseViewController, WithNavigationItem {
    
    private lazy var xibView: XibView = {
        let xib: XibView = .fromNib()
        xib.configure(
            with:
                CourseModel(
                    title: "Android разработка",
                    coast: 30.0,
                    offer: "Первые три занятия беcплатно"
                )
            )
        return xib
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "XIB"
        view.backgroundColor = .white
        showSeparatorNavigation = true
    }
    
    override func initUI() {
        self.view.addSubview(xibView)
        xibView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func initConstraints() {
        
        NSLayoutConstraint.activate([
            xibView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            xibView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            xibView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
            
        ])
    }
    
    override func initListeners() {
        
        navigationItem(set: .right(type: .settings)) { [weak self] _ in
            let vc = ViewController()
            self?.present(vc, animated: true)
        }
        
        xibView.moreTapped = { [weak self] in
            let vc = ViewController()
            self?.navController?.pushViewController(vc, animated: true)
        }
        
        xibView.addTapped = { [weak self] in
            self?.tabBarController?.selectedIndex = 3
        }
    }
}
