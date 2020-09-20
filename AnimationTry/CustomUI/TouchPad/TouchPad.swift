//
//  TouchPad.swift
//  AnimationTry
//
//  Created by Mihail on 11.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//

import Foundation
import SpriteKit

class TouchPad: SKSpriteNode {
    
    private var baseJoystick: SKSpriteNode!
    private var headJoystick: SKSpriteNode!
    
    
    init(color: UIColor, size: CGSize) {
        super.init(texture: nil, color: color, size: size)
        zPosition = 100
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        zPosition = 100
        isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let location = touches.first?.location(in: self)        
        guard let point = location else {return}
        
        let baseTexture = SKTexture(imageNamed: "Joystick")
        let baseJoystick = SKSpriteNode(texture: baseTexture)
        baseJoystick.position = point
        baseJoystick.setScale(0.3)
        self.baseJoystick = baseJoystick
        addChild(self.baseJoystick)
        
        let headTexture = SKTexture(imageNamed: "LargeHandleFilledGrey")
        let headJoystick = SKSpriteNode(texture: headTexture)
        headJoystick.position = point
        headJoystick.setScale(0.3)
        let range = SKRange(lowerLimit: 0, upperLimit: 35)
        let constraint = SKConstraint.distance(range, to: point, in: self)
        self.headJoystick = headJoystick
        
        addChild(self.headJoystick)
        
        self.headJoystick.constraints = [constraint]
        
        TouchPadManager.shared.setupCenterPadPosition(point: point)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let point = touch.location(in: self)
            
            TouchPadManager.shared.updateCurrentPosition(point: headJoystick.position)
            headJoystick.position = point
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        endTouch()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        endTouch()
    }
    
    private func endTouch() {
        TouchPadManager.shared.updateCurrentPosition(point: baseJoystick.position)
        
        removeChildren(in: [self.baseJoystick, self.headJoystick])
    }
    
}
