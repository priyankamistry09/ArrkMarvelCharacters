//
//  CharacterListProtocols.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

protocol CharacterListViewProtocol : class {
    var presenter: CharacterListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCharacters(with characters: [CharacterModel])
    func showLoading()
    func hideLoading()
    func showError()

}

protocol CharacterListWireFrameProtocol: class {
    static func createCharacterListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentCharacterDetailScreen(from view: CharacterListViewProtocol, forCharacter character: CharacterModel)
}

protocol CharacterListPresenterProtocol: class {
    var view: CharacterListViewProtocol? { get set }
    var interactor: CharacterListInteractorInputProtocol? { get set }
    var wireFrame: CharacterListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showCharacterDetail(forCharacter character: CharacterModel)
}

protocol CharacterListInteractorInputProtocol: class {
    var presenter: CharacterListInteractorOutputProtocol? { get set }
    var remoteDatamanager: CharacterListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveCharacterList()
}

protocol CharacterListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveCharacters(_ characters: [CharacterModel])
    func onError()
}

protocol CharacterListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: CharacterListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveCharacterList()
}

protocol CharacterListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onCharactersRetrieved(_ characters: [CharacterModel])
    func onError()
}

