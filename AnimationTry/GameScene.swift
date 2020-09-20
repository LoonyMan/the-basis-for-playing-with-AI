//
//  GameScene.swift
//  AnimationTry
//
//  Created by Mihail on 08.08.2020.
//  Copyright © 2020 loonyman. All rights reserved.
//
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let rangeXMap = SKRange(lowerLimit: 0, upperLimit: 10000)
    let rangeYMap = SKRange(lowerLimit: -50, upperLimit: 15)
    
    static var player: Orc1!
    
    private var touchPad: TouchPad!
    private var my_cam: SKCameraNode!
    private var levelY: CGFloat!
    private var setOfMiddleBackground: SKSpriteNode!
    private var lastPosCam: CGPoint!
    
    override func didMove(to view: SKView) {
        
        levelY = scene!.size.height * 0.25
        
        setOfMiddleBackground = SKSpriteNode(color: .clear, size: CGSize(width: 100, height: 100))
        
        addChild(setOfMiddleBackground)
        setPlayer()
        setupCamera()
        setupTouchPad()
        setupAttackButton()
        setupBackground()
        //setupGround(at: 0)
        
        generationMiddleBackgroundWithGround()
        
        TouchPadManager.shared.setController(on: GameScene.player, on: setOfMiddleBackground)
        AttackButtonManager.shared.setController(on: GameScene.player)
    }
    
    private func setupCamera() {
        my_cam = SKCameraNode()
        
        let followRange = SKRange(upperLimit: 100)
        let followConstraint = SKConstraint.distance(followRange, to: GameScene.player)
        
        let yRange = SKRange(lowerLimit: levelY - 10, upperLimit: levelY + 30)
        let yConstraint = SKConstraint.positionY(yRange)
        
        
        my_cam.constraints = [yConstraint, followConstraint]
        lastPosCam = my_cam.position
        
        scene!.camera = my_cam
        scene!.addChild(camera!)
        
    }
    
    private func setPlayer() {
        GameScene.player = Orc1()
        GameScene.player.position = CGPoint(x: 0, y: 0)
        GameScene.player.setLastPosition(position: CGPoint(x: 0, y: 0))
        
        let playerXConstraint = SKConstraint.positionX(rangeXMap)
        let playerYConstraint = SKConstraint.positionY(rangeYMap)
        
        GameScene.player.constraints = [playerXConstraint, playerYConstraint]
        
        addChild(GameScene.player)
    }
    
    private func setupTouchPad() {
        touchPad = TouchPad(color: .clear, size: CGSize(width: scene!.size.width * 0.4, height: scene!.size.height * 0.8))
        touchPad.position = CGPoint(x: -scene!.size.width / 4, y: 0)
        scene?.camera!.addChild(touchPad)
    }
    
    private func setupBackground() {
        let skyTexture = SKTexture(imageNamed: "first_sky")
        let sky = SKSpriteNode(texture: skyTexture)
        
        let bgTexture = SKTexture(imageNamed: "first_bg")
        let background = SKSpriteNode(texture: bgTexture)
        
        background.size = scene!.size
        
        my_cam.addChild(sky)
        my_cam.addChild(background)
        
    }
    
    private func setupMiddleBackground(at x: CGFloat) {
        let middleBackgroundTexture = SKTexture(imageNamed: "first_middle_decor")
        let middleBackground = SKSpriteNode(texture: middleBackgroundTexture)
        
        middleBackground.size = scene!.size
        middleBackground.position = CGPoint(x: x, y: levelY)
        middleBackground.zPosition = 8
        
        setOfMiddleBackground.addChild(middleBackground)
        
    }
    
    private func setupGround(at x: CGFloat) {
        let groundTexture = SKTexture(imageNamed: "fisrt_ground")
        let ground = SKSpriteNode(texture: groundTexture)
        
        ground.size = scene!.size
        ground.position = CGPoint(x: x, y: levelY * 0.5)
        ground.zPosition = 10
        
        addChild(ground)
    }
    
    private func generationMiddleBackgroundWithGround() {
        var middleBackgroundWidht: CGFloat = 0
        
        while middleBackgroundWidht < rangeXMap.upperLimit + scene!.size.width {
            setupMiddleBackground(at: middleBackgroundWidht)
            setupGround(at: middleBackgroundWidht)
            
            
            middleBackgroundWidht += scene!.size.width
        }
        
        //print(middleBackgroundWidht / scene!.size.width)
    }
    
    private func setupAttackButton() {
        let size = CGSize(width: scene!.size.width * 0.1, height: scene!.size.width * 0.1)
        let button = AttackButton(size: size)
        
        button.position = CGPoint(x: scene!.size.width * 0.35, y: scene!.size.height * 0.3)
        
        my_cam.addChild(button)
    }
  
    override func update(_ currentTime: TimeInterval) {
        
        //print(GameScene.player.position.x)
        TouchPadManager.shared.updateDataFromTouchPad()

    }
    
    override func didFinishUpdate() {
        if my_cam.position.x < rangeXMap.lowerLimit + scene!.size.width * 0.4 {
            my_cam.position.x = rangeXMap.lowerLimit + scene!.size.width * 0.4
        } else if my_cam.position.x > rangeXMap.upperLimit - scene!.size.width * 0.4 {
            my_cam.position.x = rangeXMap.upperLimit - scene!.size.width * 0.4
        }
        if my_cam.position.y < levelY * 0.55 {
            my_cam.position.y = levelY * 0.55
        }
        
        let res = my_cam.position.x - lastPosCam.x
        lastPosCam = my_cam.position
        let setPosition = setOfMiddleBackground.position
        
        setOfMiddleBackground.position = CGPoint(x: setPosition.x + res * 0.7, y: setPosition.y)
            
    }
}
