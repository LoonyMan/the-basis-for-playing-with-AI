//
//  GameViewController.swift
//  AnimationTry
//
//  Created by Mihail on 08.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let view = self.view as! SKView? {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .nanoseconds(100)) {
                let scene = GameScene(fileNamed: "GameScene")!
                
                scene.size = Helper.screenSize
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
                
                
                
                view.ignoresSiblingOrder = false
                
                //view.showsPhysics = true
                view.showsFPS = true
                view.showsNodeCount = true
            }
            
            
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
