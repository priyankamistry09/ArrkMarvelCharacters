//
//  CharacterListWireFrame.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

class CharacterListWireFrame: CharacterListWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    class func createCharacterListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "CharcterNavigationController")
        if let view = navController.childViewControllers.first as? CharacterListView {
            let presenter: CharacterListPresenterProtocol & CharacterListInteractorOutputProtocol = CharacterListPresenter()
            let interactor: CharacterListInteractorInputProtocol & CharacterListRemoteDataManagerOutputProtocol = CharacterListInteractor()
            let remoteDataManager: CharacterListRemoteDataManagerInputProtocol = CharacterListRemoteDataManager()
            let wireFrame: CharacterListWireFrameProtocol = CharacterListWireFrame()
            
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            view.presenter = presenter
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    func presentCharacterDetailScreen(from view: CharacterListViewProtocol, forCharacter character: CharacterModel) {
        let characterDetailViewController = CharacterDetailWireFrame.createCharacterDetailModule(forCharacter: character)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(characterDetailViewController, animated: true)
        }
        
    }
    
}
