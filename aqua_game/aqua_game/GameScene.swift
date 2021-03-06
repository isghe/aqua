//
//  GameScene.swift
//  aqua_game
//
//  Created by dalia icedo on 3/10/17.
//  Copyright © 2017 dalia icedo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var violetnoodle = SKSpriteNode()
    var pink_noodle = SKSpriteNode()
    var green_noodle = SKSpriteNode()
    var yring = SKSpriteNode()
    var bring = SKSpriteNode()
    var pring = SKSpriteNode()
    var gring = SKSpriteNode()
    var yring2 = SKSpriteNode()
    var yring3 = SKSpriteNode()
    var button1 = SKSpriteNode()
    var button2 = SKSpriteNode()
    var leftShooter = SKSpriteNode()
    var rightShooter = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        violetnoodle = self.childNode(withName: "violetnoodle") as! SKSpriteNode
        pink_noodle = self.childNode(withName: "pink_noodle") as! SKSpriteNode
        green_noodle = self.childNode(withName: "green_noodle") as! SKSpriteNode
        yring = self.childNode(withName: "yring") as! SKSpriteNode
        bring = self.childNode(withName: "bring") as! SKSpriteNode
        gring = self.childNode(withName: "gring") as! SKSpriteNode
        pring = self.childNode(withName: "pring") as! SKSpriteNode
        yring2 = self.childNode(withName: "yring2") as! SKSpriteNode
        yring3 = self.childNode(withName: "yring3") as! SKSpriteNode
        button1 = self.childNode(withName: "button1") as! SKSpriteNode
        button2 = self.childNode(withName: "button2") as! SKSpriteNode
        leftShooter = self.childNode(withName: "leftShooter") as! SKSpriteNode
        rightShooter = self.childNode(withName: "rightShooter") as! SKSpriteNode
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        let backgroundMusic = SKAudioNode(fileNamed: "music.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node : SKNode = self.atPoint(location)
            if node.name == "button1" {
                bubbles()
                print("buttonpressed")
            }
            if node.name == "button2" {
                print("button2pressed")
                bubbles2()
            }
            }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node : SKNode = self.atPoint(location)
            if node.name == "button1" {
                print("buttonpressed")
            }
            if node.name == "button1" {
                print("buttonpressed")
            }
            if node.name == "button2" {
                print("button2pressed")
            }
        }
    }
    func bubbles() {
        run(SKAction.playSoundFileNamed("bubblesound.mp3", waitForCompletion: false))
        let bubble = SKSpriteNode(imageNamed: "bubble_1")
        bubble.position = leftShooter.position
        bubble.position.y += 1
        bubble.physicsBody = SKPhysicsBody(circleOfRadius: bubble.size.width / 2)
        bubble.physicsBody?.isDynamic = true
        bubble.physicsBody?.collisionBitMask = 0
        bubble.physicsBody?.usesPreciseCollisionDetection = true
        self.addChild(bubble)
        print("LeftShooter")
        let animationDuration:TimeInterval = 1.5
        var actionArray = [SKAction]()
        
        actionArray.append(SKAction.move(to: CGPoint(x: leftShooter.position.x, y: self.frame.size.height + 10), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        
        bubble.run(SKAction.sequence(actionArray))
        
    }
    func bubbles2() {
        run(SKAction.playSoundFileNamed("bubblesound.mp3", waitForCompletion: false))
        let bubble2 = SKSpriteNode(imageNamed: "bubble_1")
        bubble2.position = rightShooter.position
        bubble2.position.y += 1
        bubble2.physicsBody = SKPhysicsBody(circleOfRadius: bubble2.size.width / 2)
        bubble2.physicsBody?.isDynamic = true
        bubble2.physicsBody?.collisionBitMask = 0
        bubble2.physicsBody?.usesPreciseCollisionDetection = true
        self.addChild(bubble2)
        print("RightShooter")
        let animationDuration:TimeInterval = 1.5
        var actionArray = [SKAction]()
        
        actionArray.append(SKAction.move(to: CGPoint(x: rightShooter.position.x, y: self.frame.size.height + 10), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        
        bubble2.run(SKAction.sequence(actionArray))
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
