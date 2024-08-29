//
//  HomeViewController.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 27/8/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tabbarView: TabBarViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        tabbarView.registerDelegate(delegate: self)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

func goToHome() {
    if #available(iOS 15, *) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let delegate = windowScene.delegate as? SceneDelegate else { return }
        let homeVC = HomeViewController.loadFromNib()
        let nav = UINavigationController(rootViewController: homeVC)
        delegate.window?.rootViewController = nav
        delegate.window?.makeKeyAndVisible()
    } else {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        let homeVC = HomeViewController.loadFromNib()
        let nav = UINavigationController(rootViewController: homeVC)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}

extension HomeViewController: TabbarProtocol {
    func navigateHome() {
      
    }
    
    func navigateMeasure() {
        let vc = MeasureViewController.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateTracking() {
        let vc = TrackingViewController.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
