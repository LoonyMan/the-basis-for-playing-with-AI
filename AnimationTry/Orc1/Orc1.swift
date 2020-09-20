//
//  Orc1.swift
//  AnimationTry
//
//  Created by Mihail on 09.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//

import Foundation
import SpriteKit

class Orc1: SKSpriteNode, MovementProtocol, AttackingProtocol {
    
    private var walking = false
    private let idleAtlas = Assets.shared.orc1.idleAtlas
    private var lastPosition: CGPoint!
    private var isAttacking = false
    
    init() {
        let sprite = idleAtlas.textureNames.sorted().first!
        let texture = SKTexture(imageNamed: sprite)
        
        super.init(texture: texture, color: .clear, size: Helper.initialSize)
        zPosition = 10
        
        startIdleAnimation()
    }
    
    func stopWalkingAnimation() {

        walking = false
        removeAction(forKey: "walking")
    }
    
    func move(with x: CGFloat, _ y: CGFloat) {
        if !isAttacking {
            startWalkingAnimation()
            let x = position.x - x * 0.05
            let y = position.y - y * 0.05
            position = CGPoint(x: x, y: y)
            
            if position.x < lastPosition.x && xScale == 1 {
                //print(-1)
                xScale = -1
            } else if position.x > lastPosition.x && xScale == -1 {
                //print(1)
                xScale = 1
            } else if position.x == lastPosition.x && position.y == lastPosition.y {
                stopWalkingAnimation()
            }
            setLastPosition(position: position)
        }
        
    }
    
    func setLastPosition(position: CGPoint) {
        
        self.lastPosition = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startIdleAnimation() {
        isAttacking = false
        
        let idleAction = SKAction(named: "Orc1_Idle")!
        
        self.run(idleAction, withKey: "idle")
    }
    
    func startDyingAnimation() {
        
        let dyingAction = SKAction(named: "Orc1_Dying")!
        
        let removeCharacter = SKAction.run {
            self.removeFromParent()
        }
        
        let sequence = SKAction.sequence([dyingAction, removeCharacter])
        
        self.run(sequence, withKey: "dying")
        
    }
    
    func startAttackingAnimation() {
        //self.removeAction(forKey: "idle")
        stopWalkingAnimation()
        if isAttacking == false {
            isAttacking = true
            let attackingAction = SKAction(named: "Orc1_Attacking")!
            let waitAction = SKAction.wait(forDuration: 0.3)
            
            let sequence = SKAction.sequence([attackingAction, waitAction])
            
            self.run(sequence) {
                self.isAttacking = false
            }
        }
    }
    
    func startWalkingAnimation() {
        
        let walkingAction = SKAction(named: "Orc1_Walking")!
        
        if walking == false {
            walking = true
            self.run(walkingAction, withKey: "walking")
        }
        
        
    }
}
