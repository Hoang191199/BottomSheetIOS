//
//  TabBarViewController.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 27/8/24.
//

import UIKit
import Reusable

protocol TabbarProtocol {
    func navigateHome()
    func navigateMeasure()
    func navigateTracking()
}

class TabBarViewController: UIView, NibOwnerLoadable {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    var indexPage: Int = 0
    
    var delegate: TabbarProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
        setupView()
    }
    
    func registerDelegate(delegate: TabbarProtocol) {
        self.delegate = delegate
    }
    
    private func setupView() {
        view1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigateHome)))
        view2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigateMeasure)))
        view3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigateTracking)))
    }

    @objc func navigateHome() {
//        let vc = HomeViewController.loadFromNib()
//        self.navigationController?.pushViewController(vc, animated: true)
        if delegate != nil {
            delegate?.navigateHome()
            indexPage = 0
        }
    }
    
    @objc func navigateMeasure() {
//        let vc = MeasureViewController.loadFromNib()
//        self.navigationController?.pushViewController(vc, animated: true)
        if delegate != nil {
            delegate?.navigateMeasure()
            indexPage = 1
        }
    }
    
    @objc func navigateTracking() {
        if delegate != nil {
            delegate?.navigateTracking()
            indexPage = 2
        }
    }
        
    func updateTabbar(){
        
    }
}
