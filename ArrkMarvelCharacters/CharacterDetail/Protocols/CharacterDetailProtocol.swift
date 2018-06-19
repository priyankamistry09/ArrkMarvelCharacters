//
//  CharacterDetailProtocol.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 19/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

protocol CharacterDetailViewProtocol: class {
    var presenter: CharacterDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCharacterDetail(forCharacter character: CharacterModel)
}

protocol CharacterDetailWireFrameProtocol: class {
    static func createCharacterDetailModule(forCharacter character: CharacterModel) -> UIViewController
}

protocol CharacterDetailPresenterProtocol: class {
    var view: CharacterDetailViewProtocol? { get set }
    var wireFrame: CharacterDetailWireFrameProtocol? { get set }
    var character: CharacterModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
