//
//  ManualVC.swift
//  HW-6
//
//  Created by Рамил Гаджиев on 08.03.2022.
//

import UIKit

class ManualVC: BaseViewController, WithNavigationItem {
    
    private lazy var cardView = ManualView(
        model:
            CourseModel(
                title: "IOS разработка",
                coast: 100.0,
                offer: "Первое занятие бесплатно"
            )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ManualVC"
        view.backgroundColor = .white
        showSeparatorNavigation = true
    }
    
    override func initUI() {
        view.addSubview(cardView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cardView.frame = CGRect(x: 20, y: 40, width: self.view.frame.width - 40, height: cardView.bounds.height)
    }
    
    override func initListeners() {
        
        navigationItem(set: .right(type: .logout)) { [weak self] _ in
            let navC = BaseNavigationController(rootViewController: ToPushVC())
            self?.present(navC, animated: true)
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
