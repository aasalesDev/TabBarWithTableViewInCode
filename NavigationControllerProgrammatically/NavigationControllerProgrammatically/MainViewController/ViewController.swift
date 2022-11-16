//
//  ViewController.swift
//  NavigationControllerProgrammatically
//
//  Created by Anderson Sales on 16/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainView()
    }
    
    private func configureMainView() {
        view.backgroundColor = .systemMint
        view.addSubview(button)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func loginButtonTapped(){
        configureTabBar()
    }
    
    private func configureTabBar() {
        let tabBarVC = UITabBarController()
        
        let firstVC = UINavigationController(rootViewController: ScreenOneViewController())
        let secondVC = UINavigationController(rootViewController: ScreenTwoViewController())
        let thirdVC = UINavigationController(rootViewController: ScreenThreeViewController())
        let fourthVC = UINavigationController(rootViewController: ScreenFourViewController())
        let fifthVC = UINavigationController(rootViewController: ScreenFiveViewController())
        
        tabBarVC.setViewControllers([firstVC, secondVC, thirdVC, fourthVC, fifthVC], animated: true)
        
        let images = ["house", "person", "bell", "gear", "menucard"]
        let titles = ["Home", "Contact", "About", "Settings", "Menu"]
        
        //TabBar Configuration (image, badge, and title)
        guard let items = tabBarVC.tabBar.items else { return }
        for index in 0..<items.count {
            items[index].badgeValue = String(index+1)
            items[index].image = UIImage(systemName: images[index])
            items[index].title = titles[index]
        }
        //TabBar configuration (borde width and border color)
        tabBarVC.tabBar.layer.borderWidth = 0.5
        tabBarVC.tabBar.layer.borderColor = UIColor.black.cgColor
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .red
        UITabBar.appearance().backgroundColor = .black
        
        //Further configuration done on SceneDelegate, inside "func scene" (for the upper part of the TabBar
        /*if #available(iOS 15, *) {
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
        }*/

        tabBarVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(tabBarVC, animated: true)
    }
}

