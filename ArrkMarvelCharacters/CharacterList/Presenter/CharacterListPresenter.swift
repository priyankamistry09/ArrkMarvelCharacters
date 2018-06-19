//
//  CharacterListPresenter.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//


class CharacterListPresenter: CharacterListPresenterProtocol {
    weak var view: CharacterListViewProtocol?
    var interactor: CharacterListInteractorInputProtocol?
    var wireFrame: CharacterListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveCharacterList()
    }
    
    func showCharacterDetail(forCharacter character: CharacterModel) {
        wireFrame?.presentCharacterDetailScreen(from: view!, forCharacter: character)
    }
    
}

extension CharacterListPresenter: CharacterListInteractorOutputProtocol {
    
    func didRetrieveCharacters(_ characters: [CharacterModel]) {
        view?.hideLoading()
        view?.showCharacters(with: characters)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}

