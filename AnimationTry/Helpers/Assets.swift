//
//  Assets.swift
//  AnimationTry
//
//  Created by Mihail on 09.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//
import SpriteKit
import Foundation

class Assets {
    
    static let shared = Assets()
    
    let orc1 = Orc1Atlases()
    
    func loadTexturesToArray(prefix: String, array: inout [SKTexture], count: Int) {
        for i in 0..<count {
            let name = "\(prefix)\(String(format: "%03d", i))"
            let texture = SKTexture(imageNamed: name)
            array.append(texture)
        }
    }
    
    func preloadAssets() {
        
        orc1.attackingAtlas.preload {
            
//            let count = self.orc1.attackingAtlas.textureNames.count
//            let prefix = "Satyr_01_Attacking_"
//
//            self.loadTexturesToArray(prefix: prefix, array: &self.orc1.attackingArray, count: count)
//
            //print("orc1_attacking have \(count), array have \(self.orc1.attackingArray.count)")
        }
        orc1.dyingAtlas.preload {
            
//            let count = self.orc1.dyingAtlas.textureNames.count
//            let prefix = "Satyr_01_Dying_"
//
//            self.loadTexturesToArray(prefix: prefix, array: &self.orc1.dyingArray, count: count)
            
            //print("orc1_dying have \(count), array have \(self.orc1.dyingArray.count)")
        }
        orc1.idleAtlas.preload {
            
//            let count = self.orc1.idleAtlas.textureNames.count
//            let prefix = "Satyr_01_Idle_"
//            
//            self.loadTexturesToArray(prefix: prefix, array: &self.orc1.idleArray, count: count)
            
            //print("orc1_idle have \(count), array have \(self.orc1.idleArray.count)")
        }
        
        orc1.hurtAtlas.preload {}
        orc1.idleBlink.preload {}
        orc1.jumpLoop.preload {}
        orc1.jumpStart.preload {}
        orc1.taunt.preload {}
        orc1.walking.preload {}
    }
}
