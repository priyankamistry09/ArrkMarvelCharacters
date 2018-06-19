//
//  CharacterDetailPresenter.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 19/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    weak var view: CharacterDetailViewProtocol?
    var wireFrame: CharacterDetailWireFrameProtocol?
    var character: CharacterModel?
    
    func viewDidLoad() {
        view?.showCharacterDetail(forCharacter: character!)
    }
    
}
