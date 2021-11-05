import UIKit

class MainTabController: UITabBarController {
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    //    MARK: - Helpers
    
    func configureViewControllers() {
        view.backgroundColor = .white
        
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        tabBar.tintColor = .black
        
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: "home_unselected", selectedImage: "home_selected", rootViewControler: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: "search_unselected", selectedImage: "search_selected", rootViewControler: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: "plus_unselected", selectedImage: "plus_selected", rootViewControler:  ImageSelectorController())
        
        let notifications = templateNavigationController(unselectedImage: "like_unselected", selectedImage: "like_selected", rootViewControler: NotificationController())
        
        let profile = templateNavigationController(unselectedImage: "profile_unselected", selectedImage: "profile_selected", rootViewControler: ProfileController())
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
    }
    
    func templateNavigationController(unselectedImage: String, selectedImage: String, rootViewControler: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewControler)
        nav.tabBarItem.image = UIImage(named: unselectedImage)
        nav.tabBarItem.selectedImage = UIImage(named: selectedImage)
        nav.navigationBar.tintColor = .black
        nav.navigationBar.barTintColor = .white
        
        return nav
    }
}

