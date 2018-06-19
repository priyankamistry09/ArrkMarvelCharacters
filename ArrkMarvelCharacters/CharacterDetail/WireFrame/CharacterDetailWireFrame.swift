//
//  CharacterDetailWireFrame.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 19/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit


class CharacterDetailWireFrame: CharacterDetailWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createCharacterDetailModule(forCharacter character: CharacterModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CharacterDetailController")
        if let view = viewController as? CharacterDetailView {
            let presenter: CharacterDetailPresenterProtocol = CharacterDetailPresenter()
            let wireFrame: CharacterDetailWireFrameProtocol = CharacterDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.character = character
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
   
    
}

