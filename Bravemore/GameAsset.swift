//
//  GameObject.swift
//  Bravemore
//
//  Created by Sam Winkelstein on 4/16/15.
//  Copyright (c) 2015 Sam Winkelstein. All rights reserved.
//

import Foundation

// Import SceneKit
import SceneKit


// The Main Class that handles All of the 3d Models and Assets in the Game
class GameAsset {
    
    private(set) var model: SCNNode;
    var position: SCNVector3;
    var active: Bool;
    var mat: SCNMaterial;
    
    private(set) var scnName: String;
    private(set) var modelName: String;
    
    //laods a specific model or node from a Collada file and sets the position to (0,0,0);
    init(SceneName :String , modelName: String) {
        self.scnName = SceneName;
        self.modelName = modelName;
        let sName = "art.scnassets/" + SceneName + ".dae";
    
        let myScene = SCNScene(named: sName)!
        position = SCNVector3(x:0, y:0,z: 0);
        let model1 = myScene.rootNode.childNodeWithName(modelName, recursively: true)!
        model = model1;
        active = false;
        model.position = position;
        mat = SCNMaterial();
        mat.diffuse.contents = model.geometry!.firstMaterial!.diffuse.contents;
        mat.multiply.contents = model.geometry!.firstMaterial!.multiply.contents;
        mat.shaderModifiers = [ SCNShaderModifierEntryPointLightingModel:
        "float intense = dot(_surface.normal, _light.direction);" +
        "if (intense > 0.95)" +
        "intense = 0.8;" +
        "else if (intense > 0.5)" +
        "intense = 0.6;" +
        "else if (intense > 0.25)" +
        "intense = 0.4;" +
        "else " +
        "intense = 0.1;" +
        "_lightingContribution.diffuse = (intense *_light.intensity.rgb);" +
        "_lightingContribution.ambient = (vec3(1.0) * intense);"
        ]
        model.geometry?.firstMaterial = mat;
    }


   //Creates a clone of a gameAsset

    init( gameAsset: GameAsset, position: SCNVector3){
        self.scnName = gameAsset.scnName;
        self.modelName = gameAsset.modelName;
        self.position = position
        let sName = "art.scnassets/" + scnName + ".dae";
                let myScene = SCNScene(named: sName)!
        model = myScene.rootNode.childNodeWithName(modelName, recursively:true)!
        model.position = position;
        mat = SCNMaterial();
        mat.diffuse.contents = model.geometry!.firstMaterial!.diffuse.contents;
        mat.multiply.contents = model.geometry!.firstMaterial!.multiply.contents;
        mat.shaderModifiers = [ SCNShaderModifierEntryPointLightingModel:
            "float intense = dot(_surface.normal, _light.direction);" +
                "if (intense > 0.95)" +
                "intense = 0.8;" +
                "else if (intense > 0.5)" +
                "intense = 0.6;" +
                "else if (intense > 0.25)" +
                "intense = 0.4;" +
                "else " +
                "intense = 0.1;" +
                "_lightingContribution.diffuse = (intense *_light.intensity.rgb);" +
            "_lightingContribution.ambient = (vec3(1.0) * intense);"
        ]
        model.geometry?.firstMaterial = mat;
        active = false;
    }


    var info: String{
        get{
            return "to-string";
        }
    }
}
