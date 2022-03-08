//
//  BaseViewController.swift
//
//  
//

import UIKit

class BaseViewController: UIViewController {
    
    var navController: BaseNavigationController? {
        self.navigationController as? BaseNavigationController
    }
    
    private let separatorNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 0
        view.layer.shadowOpacity = 0.3
        view.alpha = 1
        return view
    }()
    
    /**
     Показать или скрыть разделить navigation bar
     */
    var showSeparatorNavigation = false {
        willSet(isShow) {
            if isShow == true {
                addSeparatorNavigation()
                separatorNavigation.layer.zPosition = 100
                view.alpha = 1
            } else {
                view.alpha = 0
            }
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        initUI()
        initConstraints()
        initListeners()
        
    }
    
    func initUI() {
    }
    
    func initConstraints() {
    }
    
    func initListeners() {
        
    }
    
    private func addSeparatorNavigation() {
        view.insertSubview(separatorNavigation, at: separatorNavigation.subviews.count)
        separatorNavigation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorNavigation.topAnchor.constraint(equalTo: view.topAnchor, constant: (navController?.topbarHeight ?? 0) - 1),
            separatorNavigation.leftAnchor.constraint(equalTo: view.leftAnchor),
            separatorNavigation.rightAnchor.constraint(equalTo: view.rightAnchor),
            separatorNavigation.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
