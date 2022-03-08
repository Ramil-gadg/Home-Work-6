//
//  AutoLayoutVC.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 07.03.2022.
//

import UIKit

class AutoLayoutVC: BaseViewController, WithNavigationItem {
    
    private lazy var cardView = LayoutView(
        model:
            CourseModel(
                title: "Backend разработка",
                coast: 50.0,
                offer: "Первые три занятия беcплатно"
            )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Auto Layout"
        view.backgroundColor = .white
        showSeparatorNavigation = true
    }
    
    override func initUI() {
        self.view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func initConstraints() {
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            cardView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            cardView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20)
        ])
    }
    
    override func initListeners() {
        navigationItem(set: .right(type: .select)) { [weak self] _ in
            let vc = ViewController()
            vc.view.layer.opacity = 0.4
            self?.present(vc, animated: true)
        }
        
        cardView.moreTapped = { [weak self] in
            let vc = ViewController()
            self?.navController?.pushViewController(vc, animated: true)
        }
        
        cardView.addTapped = { [weak self] in
            self?.tabBarController?.selectedIndex = 3
        }
    }
}
