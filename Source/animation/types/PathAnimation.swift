//
//  PathAnimation.swift
//  Pods
//
//  Created by Victor Sukochev on 12/04/2017.
//
//

class PathAnimation:  AnimationImpl<Double> {
    
    convenience init(animatedNode: Shape
        , strokeStartBefore: Double = 0.0,
          strokeStartAfter: Double = 0.0,
          strokeEndBefore: Double = 1.0 ,
          strokeEndAfter: Double = 1.0,
          delay: Double = 0.0, autostart: Bool = false, fps: UInt = 30) {
        
        //let interpolationFunc = { (t: Double) -> Locus in
        //    return finalValue
        //}
        
        //self.init(animatedNode: animatedNode, valueFunc: interpolationFunc, animationDuration: animationDuration, delay: delay, autostart: autostart, fps: fps)
    }
    
    init(animatedNode: Shape, valueFunc: @escaping (Double) -> (Double, Double, Double, Double), animationDuration: Double, delay: Double = 0.0, autostart: Bool = false, fps: UInt = 30) {
        super.init(observableValue: animatedNode.formVar, valueFunc: valueFunc, animationDuration: animationDuration, delay: delay, fps: fps)
        type = .path
        node = animatedNode
        
        if autostart {
            self.play()
        }
    }
    
    init(animatedNode: Shape, factory: @escaping (() -> ((Double) -> (Double, Double, Double, Double))), animationDuration: Double, delay: Double = 0.0, autostart: Bool = false, fps: UInt = 30) {
        super.init(observableValue: animatedNode.formVar, factory: factory, animationDuration: animationDuration, delay: delay, fps: fps)
        type = .path
        node = animatedNode
        
        if autostart {
            self.play()
        }
    }
}
