//
//  BaseTabBarController.swift
//  Turkcell-POC
//
//  Created by Fikri Can Cankurtaran on 11.12.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    // MARK: - ViewModel
    
    lazy var tabBarViewModel: TabBarViewModel = {
        let viewModel = TabBarViewModel(api: Environment.Config.api)
        viewModel.viewDelegate = self
        return viewModel
    }()
    
    // MARK: - Variables
    
    static let homePageIndex = 2
    static let homePageButtonDimensions = CGSize(width: 80.0, height: 80.0)
    
    // MARK: - Middle Button
    
    let homePageButtonView = HomePageButtonView() 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBarViewModel.start()
        self.setupAppearance()
        self.addCenterButton()
        self.selectedIndex = 2
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    private func setupAppearance() {
        let customTabBar = CurvedTabBar()
        
        self.setValue(customTabBar, forKey: "tabBar")

        customTabBar.barTintColor = #colorLiteral(red: 0.9607843137, green: 0.5137254902, blue: 0.1882352941, alpha: 1)
        customTabBar.tintColor = .black
        customTabBar.unselectedItemTintColor = .white
    }
    
    private func addCenterButton() {
        homePageButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tabBar.addSubview(homePageButtonView)
        self.tabBar.bringSubviewToFront(homePageButtonView)
        
        homePageButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homePageButtonView.widthAnchor.constraint(equalToConstant: BaseTabBarController.homePageButtonDimensions.width).isActive = true
        homePageButtonView.heightAnchor.constraint(equalToConstant: BaseTabBarController.homePageButtonDimensions.height).isActive = true
        homePageButtonView.bottomAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTouchCenterButton(_:)))
        homePageButtonView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didTouchCenterButton(_ sender: AnyObject) {
        guard let homePageVC = self.viewControllers?[BaseTabBarController.homePageIndex] else { return }
        self.selectedIndex = BaseTabBarController.homePageIndex
        self.tabBarController(self, didSelect: homePageVC)
    }
    
    private func setViewControllers(withTabs tabs: [TabBarItem]) {
        var viewControllers = [UIViewController]()
        
        for (index, tab) in tabs.enumerated() {
            let homePageVC = HomePageViewController()
            let navController = UINavigationController(rootViewController: homePageVC)
            navController.tabBarItem.title = index == 2 ? "": tab.label
            navController.navigationBar.isHidden = true
            
            ImageCacheService.shared.getImage(withURL: tab.imageUrl) { (result) in
                switch result {
                case .success(let image):
                    if index == 2 {
                        navController.tabBarItem.image = nil
                        self.homePageButtonView.configure(viewModel: HomePageButtonView.ViewModel(title: tab.label, image: image))
                    } else {
                        navController.tabBarItem.image = image 
                    }
                    
                case .failure(let error):
                    print("error occurred while loading image from server, error: \(error)")
                }
            }
            
            viewControllers.append(navController)
        }
        
        self.setViewControllers(viewControllers, animated: false)
    }
}

extension BaseTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.viewControllers?[0] {
            let packagesVC = PackagesViewController()
            self.present(packagesVC, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let homePageVC = self.viewControllers?[BaseTabBarController.homePageIndex] {
            homePageButtonView.setSelected(viewController == homePageVC)
        }
    }
}

extension BaseTabBarController: TabBarViewDelegate {
    func updateTabBar() {
        self.setViewControllers(withTabs: self.tabBarViewModel.getTabs())
    }
}
