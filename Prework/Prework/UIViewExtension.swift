//
//  UIViewExtension.swift
//  Prework
//
//  Created by Francesca on 10/24/21.
//

import Foundation

import UIKit

extension UIView{
    
    private func animate(_ view: UIView, transform: CGRect, delay: Double) {
        UIView.animate(withDuration: 0.2,
                       delay: delay,
                        animations: {
                            view.bounds = transform
            }, completion: nil)
    }
     
    
    func bounceAnimate() {
        animate(self, transform: CGRect(x: bounds.origin.x + 5, y: bounds.origin.y + 5, width: bounds.size.width - 10, height: bounds.size.height - 10), delay: 0)
        animate(self, transform: CGRect(x: bounds.origin.x - 5, y: bounds.origin.y - 5, width: bounds.size.width + 10, height: bounds.size.height + 10), delay: 0.2)
    }
        
    }
