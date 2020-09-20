//
//  MovementProtocol.swift
//  AnimationTry
//
//  Created by Mihail on 12.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//

import Foundation
import SpriteKit

protocol MovementProtocol {
    func move(with x: CGFloat, _ y: CGFloat)
    func startWalkingAnimation()
    func stopWalkingAnimation()
}
