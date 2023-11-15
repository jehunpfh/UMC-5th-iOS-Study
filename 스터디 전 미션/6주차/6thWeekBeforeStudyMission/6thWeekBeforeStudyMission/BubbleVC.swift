//
//  BubbleVC.swift
//  6thWeekBeforeStudyMission
//
//  Created by 김제훈 on 11/14/23.
//

import Foundation
import UIKit
import BubbleTransition
import Lottie

class BubbleVC: UIViewController {
    @IBOutlet var someButton: UIButton!
    weak var interactiveTransition: BubbleInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someButton.addTarget(self, action: #selector(closeAction(_:)), for: .touchUpInside)
//        someButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        let animationView = LottieAnimationView(name: "LottieLogo1")
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
          animationView.topAnchor.constraint(equalTo: view.topAnchor),
          animationView.leftAnchor.constraint(equalTo: view.leftAnchor),
          animationView.rightAnchor.constraint(equalTo: view.rightAnchor),
          animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        animationView.loopMode = .loop
        animationView.play()
        
    }
    
    @objc func closeAction(_ sender: AnyObject) {
      self.dismiss(animated: true, completion: nil)
      
      // NOTE: when using interactive gestures, if you want to dismiss with a button instead, you need to call finish on the interactive transition to avoid having the animation stuck
      interactiveTransition?.finish()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      UIApplication.shared.setStatusBarStyle(.default, animated: true)
    }
}

