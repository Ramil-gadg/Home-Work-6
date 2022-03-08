//
//
//
//

import UIKit

enum TabItem: String, CaseIterable {
    case autoLayout = "Auto"
    case xib = "XIB"
    case manual = "Manual"
    case navigation = "Nav"
    case largeNav = "LNav"
    
    var title: String {
        self.rawValue
    }
    
    var iconSelected: UIImage? {
        switch self {
        case .autoLayout:
            return UIImage(systemName: "wand.and.stars")
        case .xib:
            return UIImage(systemName: "crop")
        case .manual:
            return UIImage(systemName: "paintbrush.pointed.fill")
        case .navigation:
            return UIImage(systemName: "capslock.fill")
        case .largeNav:
            return UIImage(systemName: "scribble.variable")
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .autoLayout:
            return UIImage(systemName: "wand.and.rays")
        case .xib:
            return UIImage(systemName: "crop")
        case .manual:
            return UIImage(systemName: "paintbrush.pointed")
        case .navigation:
            return UIImage(systemName: "capslock")
        case .largeNav:
            return UIImage(systemName: "scribble")
        }
    }
}

final class TabBarController: UITabBarController {
    
    private var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        additionalSetup()
        
        self.selectedIndex = 0
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        TabItem.allCases.forEach {
            self.controllers.append(initControllers(type: $0))
        }
        self.setViewControllers(controllers, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func additionalSetup() {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow

        setTabBarItemColors(appearance.stackedLayoutAppearance)
        setTabBarItemColors(appearance.inlineLayoutAppearance)
        setTabBarItemColors(appearance.compactInlineLayoutAppearance)

        self.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
        itemAppearance.selected.iconColor = .blue
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    func initControllers(type: TabItem) -> UIViewController {
        
        let navController: UINavigationController
        
        switch type {
            
        case .autoLayout:
            navController = BaseNavigationController(
                rootViewController: AutoLayoutVC()
            )
        case .xib:
            navController = BaseNavigationController(
                rootViewController: XibVC()
            )
        case .manual:
            navController = BaseNavigationController(
                rootViewController: ManualVC()
            )
        case .navigation:
            navController = BaseNavigationController(
                rootViewController: NavigationVC()
            )
        case .largeNav:
            navController = BaseNavigationController(
                rootViewController: LargeNavVC()
            )
        }
        
        navController.tabBarItem.title = type.title
        navController.tabBarItem.image = type.icon
        navController.tabBarItem.selectedImage = type.iconSelected
        
        return navController
    }
    
    deinit {
        print("TabBarCoordinator is deinit")
    }
}

