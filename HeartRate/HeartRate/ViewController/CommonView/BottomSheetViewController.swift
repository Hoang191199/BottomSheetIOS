//
//  BottomSheetViewController.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 29/8/24.
//

import UIKit

public protocol BRQBottomSheetPresentable {
    var cornerRadius: CGFloat { get set }
    var animationTransitionDuration: TimeInterval { get set }
    var barrierDismissible : Bool { get set }
    var height: CGFloat? { get set }
}

public class BottomSheetViewController: UIViewController {

    //-----------------------------------------------------------------------------
    // MARK: - Outlets
    //-----------------------------------------------------------------------------
    
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var contentViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak private var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak private var backgroundView: UIView!
    
    //-----------------------------------------------------------------------------
    // MARK: - Private properties
    //-----------------------------------------------------------------------------
   
    private let viewModel: BRQBottomSheetPresentable
    private let childViewController: UIViewController
    private var originBeforeAnimation: CGRect = .zero
    
    //-----------------------------------------------------------------------------
    // MARK: - Initialization
    //-----------------------------------------------------------------------------
    
    public init(viewModel: BRQBottomSheetPresentable, childViewController: UIViewController) {
        self.viewModel = viewModel
        self.childViewController = childViewController
        super.init(
            nibName: String(describing: BottomSheetViewController.self),
            bundle: Bundle(for: BottomSheetViewController.self)
        )
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomSheetViewController {
   
   override public func viewDidLoad() {
       super.viewDidLoad()
       contentView.alpha = 1
       configureChild()
       
       let gesture = UIPanGestureRecognizer(target: self, action: #selector(BottomSheetViewController.panGesture))
       contentView.addGestureRecognizer(gesture)
       
       contentViewBottomConstraint.constant = -childViewController.view.frame.height
       view.layoutIfNeeded()
   }
   
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if viewModel.height == nil {
            contentViewHeight.isActive = false
        } else {
            contentViewHeight.constant = viewModel.height ?? 250
        }
        
        contentViewBottomConstraint.constant = 0
        UIView.animate(withDuration: viewModel.animationTransitionDuration) {
            self.backgroundView.backgroundColor = Color(hex: "F9FAFF")?.withAlphaComponent(0.4)
            self.view.layoutIfNeeded()
        }
        
        if viewModel.barrierDismissible {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap))
            self.backgroundView.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func handleBackgroundTap(){
        dismissViewController()
    }
   
   override public func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
       contentView.roundCorners([.topLeft, .topRight], radius: viewModel.cornerRadius)
       originBeforeAnimation = contentView.frame
   }
}

//-----------------------------------------------------------------------------
// MARK: - Public Methods
//-----------------------------------------------------------------------------

extension BottomSheetViewController {
   public func dismissViewController() {
       contentViewBottomConstraint.constant = -childViewController.view.frame.height
       UIView.animate(withDuration: viewModel.animationTransitionDuration, animations: {
           self.view.layoutIfNeeded()
           self.view.backgroundColor = .clear
       }, completion: { _ in
           self.dismiss(animated: false, completion: nil)
       })
   }
}

//-----------------------------------------------------------------------------
// MARK: - Private Methods
//-----------------------------------------------------------------------------

private extension BottomSheetViewController {
   
   private func configureChild() {
       addChild(childViewController)
       contentView.addSubview(childViewController.view)
       childViewController.didMove(toParent: self)
       
       guard let childSuperView = childViewController.view.superview else { return }

       NSLayoutConstraint.activate([
           childViewController.view.bottomAnchor.constraint(equalTo: childSuperView.bottomAnchor),
           childViewController.view.topAnchor.constraint(equalTo: childSuperView.topAnchor),
           childViewController.view.leftAnchor.constraint(equalTo: childSuperView.leftAnchor),
           childViewController.view.rightAnchor.constraint(equalTo: childSuperView.rightAnchor)
        ])
       
       childViewController.view.translatesAutoresizingMaskIntoConstraints = false
   }
   
   private func shouldDismissWithGesture(_ recognizer: UIPanGestureRecognizer) -> Bool {
       return recognizer.state == .ended
   }
   
   @objc private func panGesture(_ recognizer: UIPanGestureRecognizer) {
       let point = recognizer.location(in: view)
       
       if shouldDismissWithGesture(recognizer) {
           dismissViewController()
       } else {
           if point.y <= originBeforeAnimation.origin.y {
               recognizer.isEnabled = false
               recognizer.isEnabled = true
               return
           }
           contentView.frame = CGRect(x: 0, y: point.y, width: view.frame.width, height: view.frame.height)
       }
   }
}
