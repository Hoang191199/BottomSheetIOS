//
//  TrackingViewController.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 27/8/24.
//

import UIKit
import PanModal

class TrackingViewController: UIViewController {
    @IBOutlet weak var tabbarView: TabBarViewController!
    
    var bottomSheetVC : BottomSheetViewController!
    var myViewController = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Tracking"
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

    @IBAction func actionShowButtomSheet(_ sender: Any) {
        
        let bottomSheetViewModel = BRQBottomSheetViewModel(
            cornerRadius: 20,
            animationTransitionDuration: 0.3,
            backgroundColor: nil,
            barrierDismissible: true,
            height: nil
        )
        
        bottomSheetVC = BottomSheetViewController(
            viewModel: bottomSheetViewModel,
            childViewController: myViewController
        )
        
//        bottomSheetVC.dismissViewController()
        
        presentBottomSheet(bottomSheetVC, completion: nil)
    }
}

extension TrackingViewController: TabbarProtocol {
    func navigateHome() {
        let vc = HomeViewController.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateMeasure() {
        let vc = MeasureViewController.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateTracking() {
        
    }
}

//extension TrackingViewController: PanModalPresentable {
//
//    var panScrollable: UIScrollView? {
//        return nil
//    }
//}
