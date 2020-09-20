//
//  PlayerMovement.swift
//  AnimationTry
//
//  Created by Mihail on 11.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//

import Foundation
import SpriteKit

class TouchPadManager{
    
    static let shared = TouchPadManager()
    
    private var background: SKSpriteNode?
    private var player: MovementProtocol?
    private var centerLocation: CGPoint!
    private var currentLocation: CGPoint!
    
    func removeControllerOnPlayer() {
        
        player = nil
    }
    
    func setController(on player: MovementProtocol, on background: SKSpriteNode) {
    
        self.player = player
        self.background = background
    }
    
    func updateCurrentPosition(point: CGPoint) {
        
        currentLocation = point
        
    }
    
    func setupCenterPadPosition(point: CGPoint) {
        
        centerLocation = point
        currentLocation = point
        
    }
    
    func updateDataFromTouchPad() {
        
        guard let root = self.centerLocation else {return}
        guard let head = self.currentLocation else {return}
        
        let x = root.x - head.x
        let y = root.y - head.y
        
        player?.move(with: x, y)
        
    }
    
    func moveBackground(with x: CGFloat, y: CGFloat) {
        //background?.position = CGPoint(x: x * 0.5, y: -y * 0.5)
    }
}


