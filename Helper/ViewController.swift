//
//  ViewController.swift
//  Helper
//
//  Created by Andrey on 13.01.2022.
//

import UIKit

class ViewController: UITabBarController {
    
    private var newsNavigationController: UINavigationController?
    private var weatherNavigationController: UINavigationController?
    private var mapNavigationController: UINavigationController?
    private var profileNavigationController: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBarControllers()
        makeNewsViewController()
        makeMapViewController()
        makeWeatherViewController()
        makeProfileViewController()
    }
    
    private func makeNewsViewController() -> UINavigationController? {
        let profileVC = NewsAssembly().build()
        newsNavigationController = UINavigationController(rootViewController: profileVC)

        let profileItem = UITabBarItem(title: Constants.news, image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
        newsNavigationController?.tabBarItem = profileItem
        newsNavigationController?.navigationBar.prefersLargeTitles = true
        newsNavigationController?.navigationBar.topItem?.title = Constants.news
        return newsNavigationController
    }
    
    private func makeMapViewController() -> UINavigationController? {
        let mapVC = MapAssembly().build()
        mapNavigationController = UINavigationController(rootViewController: mapVC)
        let profileItem = UITabBarItem(title: Constants.map, image: UIImage(systemName: "globe"), selectedImage: nil)
        mapNavigationController?.tabBarItem = profileItem
        return mapNavigationController
    }
    
    private func makeWeatherViewController() -> UINavigationController? {
        let weatherVC = WeatherAssembly().build()
        weatherNavigationController = UINavigationController(rootViewController: weatherVC)
        let profileItem = UITabBarItem(title: Constants.weather, image: UIImage(systemName: "sun.max"), selectedImage: nil)
        weatherNavigationController?.tabBarItem = profileItem
        weatherNavigationController?.navigationBar.prefersLargeTitles = true
        weatherNavigationController?.navigationBar.topItem?.title = "Weather"
        return weatherNavigationController
    }
    
    private func makeProfileViewController() -> UINavigationController? {
        let profileVC = ProfileAssembly().build()
        profileNavigationController = UINavigationController(rootViewController: profileVC)
        let profileItem = UITabBarItem(title: Constants.profile, image: UIImage(systemName: "person"), selectedImage: nil)
        profileNavigationController?.tabBarItem = profileItem
        profileNavigationController?.navigationBar.prefersLargeTitles = true
        profileNavigationController?.navigationBar.topItem?.title = "Profile"
        return profileNavigationController
    }
    
    private func makeTabBarControllers() {
        var array = [UIViewController]()
        
        if let newsNavigationController = makeNewsViewController() {
            array.append(newsNavigationController)
        }
        
        if let mapNavigationController = makeMapViewController() {
            array.append(mapNavigationController)
        }
        
        if let weatherNavigationController = makeWeatherViewController() {
            array.append(weatherNavigationController)
        }
        
        if let profileNavigationController = makeProfileViewController() {
            array.append(profileNavigationController)
        }
        UITabBar.appearance().backgroundColor = .lightGray
        viewControllers = array
        
    }
}
