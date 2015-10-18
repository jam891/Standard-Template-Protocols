//
//  Forceable.swift
//  STP
//
//  Created by Chris O'Neil on 10/18/15.
//  Copyright © 2015 Because. All rights reserved.
//

import UIKit

public protocol Forceable {
    func makeForceable()
    func didStartForcing(force:CGFloat)
    func didForce(force:CGFloat, lastForce:CGFloat)
    func didFinishForcing(force:CGFloat)
}

public extension Forceable where Self:UIView {
    func makeForceable() {
        var lastForce:CGFloat = 1.0
        let gestureRecognizer = ForceTouchGestureRecognizer { [unowned self] (recognizer) -> Void in
            let force = recognizer as! ForceTouchGestureRecognizer
            switch force.state {
            case .Began:
                self.didStartForcing(force.force)
            case .Ended, .Failed, .Cancelled:
                self.didFinishForcing(force.force)
            default:
                self.didForce(force.force, lastForce: lastForce)
                lastForce = force.force
            }
        }
        self.addGestureRecognizer(gestureRecognizer)
    }

    func didStartForcing(force:CGFloat) {
        print("didStartForcing")
        return
    }

    func didForce(force:CGFloat, lastForce:CGFloat) {
        print("force = \(force)")
        return
    }

    func didFinishForcing(force:CGFloat) {
        print("didFinishForcing")
        return
    }
}
