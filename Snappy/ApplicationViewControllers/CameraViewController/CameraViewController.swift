//
//  CameraViewController.swift
//  Snappy
//
//  Created by Marcel Starczyk on 10/11/16.
//  Copyright © 2016 Droids on Roids. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    @IBOutlet private weak var takePhotoButton: TakePhotoButton!
    @IBOutlet private weak var takePhotoButtonWidth: NSLayoutConstraint!
    @IBOutlet private weak var takePhotoButtonHeight: NSLayoutConstraint!
    
    private struct Constants {
        static let constraintsSizeDefault: CGFloat = 50.0
        static let constraintsSizeAfterAnimation: CGFloat = 65.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateBackground()
    }
    
    private func animateBackground() {
        UIView.animate(withDuration: 2.0) { 
            self.view.backgroundColor = .black
        }
    }
    
    private func changeConstraintsConstantWithValue(value: CGFloat) {
        [takePhotoButtonWidth, takePhotoButtonHeight].forEach { constraint in
            constraint.constant = value
        }
    }
    
    @IBAction private func takePhotoButtonAction(sender: UIButton) {
        takePhotoButton.animateColor()
        
        changeConstraintsConstantWithValue(value: Constants.constraintsSizeAfterAnimation)
        
        UIView.animate(withDuration: 0.35, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            self.changeConstraintsConstantWithValue(value: Constants.constraintsSizeDefault)
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
