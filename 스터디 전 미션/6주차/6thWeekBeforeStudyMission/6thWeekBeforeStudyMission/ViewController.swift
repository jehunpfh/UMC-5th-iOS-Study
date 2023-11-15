//
//  ViewController.swift
//  6thWeekBeforeStudyMission
//
//  Created by 김제훈 on 11/14/23.
//

import UIKit
import BubbleTransition
import Lottie

class ViewController: UIViewController {
    @IBOutlet var popUpButton: UIButton!
    
    let transition = BubbleTransition()
    let interactiveTransition = BubbleInteractiveTransition()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? BubbleVC {
            controller.transitioningDelegate = self
            controller.modalPresentationStyle = .custom
            controller.modalPresentationCapturesStatusBarAppearance = true
            controller.interactiveTransition = interactiveTransition
            interactiveTransition.attach(to: controller)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popUpButton.addTarget(self, action: #selector(centerBtnTouched(_:)), for: .touchUpInside)
    }
    
    @objc func centerBtnTouched(_ sender: UIButton) {
        let sb = UIStoryboard(name: "BubbleVC", bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: "BubbleVC") as? BubbleVC {
//            vc.modalPresentationStyle = .custom
            //            vc.modalTransitionStyle = .coverVertical
//            self.present(vc, animated: true)
            
            let segue = UIStoryboardSegue(identifier: "showSegue", source: self, destination: vc)
            prepare(for: segue, sender: sender)
            self.present(vc, animated: true)
        }
        
    }
    
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = popUpButton.center
        transition.bubbleColor = popUpButton.backgroundColor ?? UIColor(named: "Lottie Custom")!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = popUpButton.center
        transition.bubbleColor = popUpButton.backgroundColor ?? UIColor(named: "Lottie Custom")!
        return transition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition
    }
}
