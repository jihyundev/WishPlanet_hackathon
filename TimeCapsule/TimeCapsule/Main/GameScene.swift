//
//  GameScene.swift
//  TimeCapsule
//
//  Created by Beomcheol Kwon on 2021/03/12.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    struct PhysicsCategory {
        static let none: UInt32 = UInt32.max
        static let wall: UInt32 = 0b1 // 1
        static let tile: UInt32 = 0b10 // 2
    }
    
    var index: Int = 0
    var currentItemCount: Int = 0
    let manager = CMMotionManager()
    let bodySize: CGFloat = 15
    lazy var x: CGFloat = (-bodySize * 2)
    lazy var y: CGFloat = bodySize * 2
    
    override func didMove(to view: SKView) {
        if currentItemCount>0 {
            for i in 0..<currentItemCount {
                createTile(count: i, index: index)
            }
        }
        
        createWall()
        print(self.size.width)
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: .main) { data, error in
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 2, dy: CGFloat((data?.acceleration.y)!) * 2)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
     
    }
    
    
    func createTile(count: Int, index: Int) {
        
        x += (bodySize * 2)
        if x >= self.size.width - bodySize * 4 {
            x = bodySize
            y += (bodySize * 2)
        }

        let tile = SKSpriteNode(imageNamed: "dol_1")
        tile.position = .init(x: x, y: y)
        tile.physicsBody = SKPhysicsBody(circleOfRadius: bodySize)
        tile.physicsBody?.isDynamic = true
        tile.physicsBody?.allowsRotation = true
        tile.physicsBody?.pinned = false
        tile.physicsBody?.affectedByGravity = true
        
        tile.physicsBody?.categoryBitMask = PhysicsCategory.tile
        tile.physicsBody?.collisionBitMask = PhysicsCategory.none
        tile.physicsBody?.fieldBitMask = PhysicsCategory.none
        tile.physicsBody?.contactTestBitMask = PhysicsCategory.wall
        tile.physicsBody?.usesPreciseCollisionDetection = true
        
        addChild(tile)
        
    }
    
    func createWall() {
        
        let tile: SKSpriteNode = {
            let size = CGSize(width: 1, height: self.size.height)
            let tile = SKSpriteNode(color: .clear, size: size)
            
            tile.position = .init(x: 0, y: self.size.height/2)
            tile.physicsBody = SKPhysicsBody(rectangleOf: size)
            tile.physicsBody?.isDynamic = false
            tile.physicsBody?.allowsRotation = false
            tile.physicsBody?.pinned = false
            tile.physicsBody?.affectedByGravity = false
            
            tile.physicsBody?.categoryBitMask = PhysicsCategory.wall
            tile.physicsBody?.collisionBitMask = PhysicsCategory.none
            tile.physicsBody?.fieldBitMask = PhysicsCategory.none
            tile.physicsBody?.contactTestBitMask = PhysicsCategory.tile
            tile.physicsBody?.usesPreciseCollisionDetection = true
            
            return tile
        }()
        addChild(tile)
        
        let tile2: SKSpriteNode = {
            let size = CGSize(width: 1, height: self.size.height)
            let tile = SKSpriteNode(color: .clear, size: size)
            
            tile.position = .init(x: self.size.width, y: self.size.height/2)
            tile.physicsBody = SKPhysicsBody(rectangleOf: size)
            tile.physicsBody?.isDynamic = false
            tile.physicsBody?.allowsRotation = false
            tile.physicsBody?.pinned = false
            tile.physicsBody?.affectedByGravity = false
            
            tile.physicsBody?.categoryBitMask = PhysicsCategory.wall
            tile.physicsBody?.collisionBitMask = PhysicsCategory.none
            tile.physicsBody?.fieldBitMask = PhysicsCategory.none
            tile.physicsBody?.contactTestBitMask = PhysicsCategory.tile
            return tile
        }()
        
        addChild(tile2)
        
        
        let tile3: SKSpriteNode = {
            let size = CGSize(width: self.size.width, height: 1)
            let tile = SKSpriteNode(color: .clear, size: size)
            
            tile.position = .init(x: self.size.width/2, y: 0)
            tile.physicsBody = SKPhysicsBody(rectangleOf: size)
            tile.physicsBody?.isDynamic = false
            tile.physicsBody?.allowsRotation = false
            tile.physicsBody?.pinned = false
            tile.physicsBody?.affectedByGravity = false
            
            tile.physicsBody?.categoryBitMask = PhysicsCategory.wall
            tile.physicsBody?.collisionBitMask = PhysicsCategory.none
            tile.physicsBody?.fieldBitMask = PhysicsCategory.none
            tile.physicsBody?.contactTestBitMask = PhysicsCategory.tile
            return tile
        }()
        
        addChild(tile3)
        
        let tile4: SKSpriteNode = {
            let size = CGSize(width: self.size.width, height: 1)
            let tile = SKSpriteNode(color: .clear, size: size)
            
            tile.position = .init(x: self.size.width/2, y: self.size.height)
            tile.physicsBody = SKPhysicsBody(rectangleOf: size)
            tile.physicsBody?.isDynamic = false
            tile.physicsBody?.allowsRotation = false
            tile.physicsBody?.pinned = false
            tile.physicsBody?.affectedByGravity = false
            
            tile.physicsBody?.categoryBitMask = PhysicsCategory.wall
            tile.physicsBody?.collisionBitMask = PhysicsCategory.none
            tile.physicsBody?.fieldBitMask = PhysicsCategory.none
            tile.physicsBody?.contactTestBitMask = PhysicsCategory.tile
            return tile
        }()
        
        addChild(tile4)
    }
    

}