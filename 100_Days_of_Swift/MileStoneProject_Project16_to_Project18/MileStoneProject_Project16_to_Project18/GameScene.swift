//
//  GameScene.swift
//  MileStoneProject_Project16_to_Project18
//
//  Created by Peter on 2022/03/16.
//

import SpriteKit

class GameScene: SKScene {
    
    var scoreLabel: SKLabelNode!
    var gameTimeLabel: SKLabelNode!
    var h1: SKShapeNode!
    var h2: SKShapeNode!
    var gameTime = 60 {
        didSet {
            gameTimeLabel.text = "\(gameTime)"
        }
    }
    var gameTimer: Timer?
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    
    
    override func didMove(to view: SKView) {
             
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        gameTimeLabel = SKLabelNode(fontNamed: "Chalkduster")
        gameTimeLabel.position = CGPoint(x: 950, y: 720)
        addChild(gameTimeLabel)
        
        
        h1 = SKShapeNode(rect: CGRect(x: 0, y: 512, width: 1024, height: 5))
        h1.fillColor = .white
        addChild(h1)
        
        h2 = SKShapeNode(rect: CGRect(x: 0, y: 256, width: 1024, height: 5))
        h2.fillColor = .white
        addChild(h2)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
//        256
        score = 0
        gameTime = 10
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeTarget), userInfo: nil, repeats: true)
    }
    
    @objc func makeTarget(){
        
        if gameTime <= 1 {
            gameTimer?.invalidate()
        }
        
        let upper = SKSpriteNode(imageNamed: "ballBlue")
        let middle = SKSpriteNode(imageNamed: "ballRed")
        let lower = SKSpriteNode(imageNamed: "ballGreen")
        
        
        upper.position = CGPoint(x: -100, y: 640)
        middle.position = CGPoint(x: 1200, y: 384)
        lower.position = CGPoint(x: -100, y: 128)
        
        addChild(upper)
        addChild(middle)
        addChild(lower)
        
        upper.physicsBody = SKPhysicsBody(circleOfRadius: upper.size.width / 2.0)
        middle.physicsBody = SKPhysicsBody(circleOfRadius: middle.size.width / 2.0)
        lower.physicsBody = SKPhysicsBody(circleOfRadius: lower.size.width / 2.0)
        
        upper.physicsBody?.velocity = CGVector(dx: Int.random(in: 300...500), dy: 0)
        middle.physicsBody?.velocity = CGVector(dx: -Int.random(in: 200...600), dy: 0)
        lower.physicsBody?.velocity = CGVector(dx: Int.random(in: 100...600), dy: 0)
        
        upper.physicsBody?.categoryBitMask = 0
        middle.physicsBody?.categoryBitMask = 0
        lower.physicsBody?.categoryBitMask = 0
        
        upper.physicsBody?.linearDamping = 0
        middle.physicsBody?.linearDamping = 0
        lower.physicsBody?.linearDamping = 0
        
        gameTime -= 1
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        
        let objects = nodes(at: location)
        
        if let object = objects.first {
            
            object.removeFromParent()
            score += 1
        }
    }
    


    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x < -300 {
                node.removeFromParent()
            }
            
            if node.position.x > 1400 {
                node.removeFromParent()
            }
        }
    }
}
