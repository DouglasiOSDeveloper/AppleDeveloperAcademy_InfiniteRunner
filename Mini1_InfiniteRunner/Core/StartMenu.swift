//
//  StartMenu.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 28/07/21.
//

import SpriteKit

class StartMenu {
    
    // Propriedades
    let GameView: SKScene
    
    let backGround: SKSpriteNode
    let logo: SKSpriteNode
    let playButton: SKSpriteNode
    let scoreButton: SKSpriteNode
    let musicButton: SKSpriteNode
    
    init(view: SKScene) {
        // Propriedades da gameScene
        self.GameView = view
        
        // Imagens
        self.backGround = SKSpriteNode(imageNamed: "BG_menu")
        self.logo = SKSpriteNode(imageNamed: "name")
        self.playButton = SKSpriteNode(imageNamed: "playButton")
        self.scoreButton = SKSpriteNode(imageNamed: "gameCenterButton")
        self.musicButton = SKSpriteNode(imageNamed: "button_sound_on")
    }
    
    // MARK:- BACKGROUND
    
    // opa
    func createbackGroundHUD() {
        backGround.name = "backGround"
        backGround.zPosition = -3
        backGround.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*0.0)
        // Escala do backGround funciona diferente. Ele pega o tamanho em relacao ao fra
        backGround.size = CGSize(width: GameView.frame.width, height: GameView.frame.height)
        backGround.texture?.filteringMode = .nearest
        GameView.addChild(backGround)
    }
    
    // MARK: - TITULO LOGO
    
    func createLogo() {
        logo.name = "logo"
        logo.zPosition = 1
        logo.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*0.1)
        logo.setScale(2.0)
        logo.texture?.filteringMode = .nearest
        GameView.addChild(logo)
        
    }
    
    // MARK: - Play BUTTON
    func createPlayButtom() {
        playButton.name = "playButton"
        playButton.zPosition = 1
        playButton.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*(-0.2))
        playButton.setScale(1.5)
        playButton.texture?.filteringMode = .nearest
        GameView.addChild(playButton)
    }
    
    // MARK: - Music BUTTON
    
    func createMusicButtom() {
        musicButton.name = "soundButton"
        musicButton.zPosition = 1
        musicButton.position = CGPoint(x: GameView.frame.width*(0.4), y: GameView.frame.height*(0.35))
        musicButton.setScale(2.0)
        musicButton.texture?.filteringMode = .nearest
        GameView.addChild(musicButton)
    }
    
    // MARK: - Music BUTTON
    func createGameCenterButtom() {
        scoreButton.name = "gameCenterButton"
        scoreButton.zPosition = 1
        scoreButton.position = CGPoint(x: GameView.frame.width*(0.33), y: GameView.frame.height*(0.35))
        scoreButton.setScale(2.0)
        scoreButton.texture?.filteringMode = .nearest
        GameView.addChild(scoreButton)
    }
    
    
    
}



extension StartMenu {
    
    
    
    
}
