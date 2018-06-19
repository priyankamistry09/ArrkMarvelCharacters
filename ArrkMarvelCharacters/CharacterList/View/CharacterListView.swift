//
//  CharacterListView.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit
import PKHUD

class CharacterListView: UIViewController {
    
    @IBOutlet var collection: UICollectionView!

    var presenter: CharacterListPresenterProtocol?
    var CharacterList: [CharacterModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension CharacterListView: CharacterListViewProtocol {
    func showCharacters(with characters: [CharacterModel]) {
        CharacterList = characters
        collection.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension CharacterListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collection.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CharacterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionCell", for: indexPath) as! CharacterCollectionViewCell
        let character = CharacterList[indexPath.row]
        cell.setData(forCharacter: character)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showCharacterDetail(forCharacter: CharacterList[indexPath.row])
    }
    
}

