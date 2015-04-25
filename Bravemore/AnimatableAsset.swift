//
//  AnimatableAsset.swift
//  Bravemore
//
//  Created by Sam Winkelstein on 4/16/15.
//  Copyright (c) 2015 Sam Winkelstein. All rights reserved.
//

import Foundation

import SceneKit

import QuartzCore


class AnimatableAsset: GameAsset {
    
   // private(set) var animations: CAAnimation;
    
   override init(SceneName: String, modelName: String) {
        super.init(SceneName: SceneName, modelName: modelName);

        
    }
    
    override init(gameAsset: GameAsset, position: SCNVector3) {
        super.init(gameAsset: gameAsset, position: position);
    }
    func addAnimation(animation: String, fileName: String){
    
        let url = NSBundle.mainBundle().URLForResource(fileName, withExtension: "dae", subdirectory: "art.scnassets/")
        let sceneSource = SCNSceneSource(URL: url!, options: [
            SCNSceneSourceAnimationImportPolicyKey : SCNSceneSourceAnimationImportPolicyDoNotPlay
            ])
        let tmpAnimation = sceneSource!.entryWithIdentifier(fileName, withClass: CAAnimation.self) as! CAAnimation
        
        tmpAnimation.repeatCount = FLT_MAX;
        tmpAnimation.usesSceneTimeBase = false;
            
        super.model.addAnimation(tmpAnimation, forKey: animation)
        }
}