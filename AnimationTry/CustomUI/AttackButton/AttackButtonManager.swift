//
//  AttackButtonManager.swift
//  AnimationTry
//
//  Created by Mihail on 12.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//

import Foundation
import SpriteKit

class AttackButtonManager {
    
    static let shared = AttackButtonManager()
    
    private var player: AttackingProtocol?
    
    func removeControllerOnPlayer() {
        player = nil
    }
    
    func setController(on player: AttackingProtocol) {
        self.player = player
    }
    
    func startAttackingAnimation() {
        
        player?.startAttackingAnimation()
    }
}
