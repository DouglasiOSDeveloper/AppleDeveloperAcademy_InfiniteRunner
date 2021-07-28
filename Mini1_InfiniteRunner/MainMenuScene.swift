//
//  MainMenuScene.swift
//  Mini1_InfiniteRunner
//
//  Created by Douglas Figueirôa on 16/07/21.
//

import SpriteKit



class MainMenuScene: SKScene{
    
    var startMenu: StartMenu!
    
    
    var music = true
        
    let audioNode = SKAudioNode(fileNamed: "Sound8bitMainMenu.wav")
        
    static var flag = false
        
    static let sharedGS = GameScene(size: CGSize(width: 844, height: 390))

    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.startMenu = StartMenu(view: self)
        
    }
    
   
    
    
    override func didMove(to view: SKView) {
        print("Dentro do Menu")
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Adicionado as imagens na cena
        startMenu.CreatebackGroundHUD()
        
        if !MainMenuScene.flag{
            audioNode.autoplayLooped = true
            audioNode.name = "AudioMainMenu"
            audioNode.run(.changeVolume(to: 0.50, duration: 0))
            addChild(audioNode)
        }

        
        //playSoundMainMenu()
        //createBackground()
        soundButton()
        gameCenterButton()
        playButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            if touch == touches.first{
                print("Indo para o jogo")
                enumerateChildNodes(withName: "//*", using: {(node,stop) in
                    
                    
                    switch node.name {
                    case "playButton":
                        if node.contains(touch.location(in: self)){
                            ActionManage.shared.sceneTransition(self, toScene: .GameScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
                            // Vibração
                            let generator = UIImpactFeedbackGenerator()
                            generator.impactOccurred()
                        }
                    case "soundButton":
                        if node.contains(touch.location(in: self)){
                            if MainMenuScene.flag {
                                self.audioNode.run(.changeVolume(to: 0.5, duration: 0))
                                self.addChild(self.audioNode)
                                MainMenuScene.flag = false
                            } else {
                                self.audioNode.run(.changeVolume(to: 0.0, duration: 0))
                                self.removeChildren(in: [self.audioNode])
                                MainMenuScene.flag = true
                            }

                        }
                    case "gameCenterButton":
                        if node.contains(touch.location(in: self)){
                            //implementar o game center ao tocar ak
                            print("Game center")
                            
                            guard let gameViewController = self.view?.window?.rootViewController as? GameViewController else {
                                return
                            }
                            
                            // Vibração
                            let generator = UIImpactFeedbackGenerator()
                            generator.impactOccurred()
                            gameViewController.transitionToGameCenter()
                        }
                    default: break
                    }
                    
                })
            }
        }
    }
    
    
    
    func createBackground(){
        let menuBackground = SKSpriteNode(imageNamed: "MenuBackGround")
        menuBackground.name = "menuBackground"
        menuBackground.position = CGPoint.zero
        menuBackground.size = CGSize(width: 844.0, height: 390.0)
        menuBackground.zPosition = -1
        addChild(menuBackground)
    }
    
    func playButton(){
        let playButton = SKSpriteNode(imageNamed: "playButton")
        playButton.name = "playButton"
        playButton.position = CGPoint.zero
        playButton.zPosition = 1
        playButton.size = CGSize(width: 100, height: 100)
        addChild(playButton)
    }
    
    
    func soundButton(){
        let configButton = SKSpriteNode(imageNamed: "soundButton")
        configButton.name = "soundButton"
        configButton.position = CGPoint.init(x: 290, y: 120)
        configButton.size = CGSize(width: 80, height: 60)
        addChild(configButton)
    }
    
    func gameCenterButton(){
        //GameScene.sharedGC.showLeaderboards(self)
        let gameCenterButton = SKSpriteNode(imageNamed: "gameCenterButton")
        gameCenterButton.name = "gameCenterButton"
        gameCenterButton.position = CGPoint.init(x: -300, y: -125)
        gameCenterButton.size = CGSize.init(width: 40, height: 40)
        self.addChild(gameCenterButton)
    }
       
//    func playSoundMainMenu(){
//        let audioNode = SKAudioNode(fileNamed: "Sound8bitMainMenu.wav")
//        audioNode.autoplayLooped = true
//        audioNode.name = "AudioMainMenu"
//        audioNode.run(.changeVolume(to: 0.50, duration: 0))
//        self.addChild(audioNode)
//    }
//
    

    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
