//
//  CharacterListInteractor.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

class CharacterListInteractor: CharacterListInteractorInputProtocol {
    weak var presenter: CharacterListInteractorOutputProtocol?
    var remoteDatamanager: CharacterListRemoteDataManagerInputProtocol?
    
    func retrieveCharacterList() {
        do {
            remoteDatamanager?.retrieveCharacterList()
            
        } catch {
            presenter?.didRetrieveCharacters([])
        }
    }
    
}

extension CharacterListInteractor: CharacterListRemoteDataManagerOutputProtocol {
  
    
    func onCharactersRetrieved(_ characters: [CharacterModel]) {
        presenter?.didRetrieveCharacters(characters)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
