//
//  CharacterCollectionViewCell.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 19/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit
import AlamofireImage

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setData(forCharacter character: CharacterModel) {
        titleLabel?.text = character.name
        let url = URL(string: character.thumbImageUrl)!
       
        let placeholderImage = UIImage(named: "placeholder")!
        characterImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }

}
