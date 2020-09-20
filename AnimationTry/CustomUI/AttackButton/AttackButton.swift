//
//  AttackButton.swift
//  AnimationTry
//
//  Created by Mihail on 12.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//

import Foundation
import SpriteKit

class AttackButton: SKSpriteNode {
    
    init(size: CGSize) {
        let texture = SKTexture(imageNamed: "SmallHandle")
        super.init(texture: texture, color: .clear, size: size)
        zPosition = 100
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AttackButtonManager.shared.startAttackingAnimation()
    }
    
}
