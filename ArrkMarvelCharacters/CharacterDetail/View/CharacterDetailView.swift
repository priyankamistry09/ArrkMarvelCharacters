//
//  CharacterDetailView.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 19/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//

import UIKit

class CharacterDetailView: UIViewController {
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var comicTable: UITableView!
    @IBOutlet weak var comicHeaderHeightConstraint:NSLayoutConstraint!
    @IBOutlet weak var comicTableHeightConstraint:NSLayoutConstraint!

    var presenter: CharacterDetailPresenterProtocol?
    var character : CharacterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension CharacterDetailView: CharacterDetailViewProtocol {
    
    func showCharacterDetail(forCharacter character: CharacterModel) {
        self.character = character
        titleLabel?.text = character.name
        biographyLabel.text = character.description
        biographyLabel.sizeToFit()
        
        if character.comics.count <= 0 {
            comicHeaderHeightConstraint.constant = 0.0
        }
        let url = URL(string: character.thumbImageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        characterImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
}

extension CharacterDetailView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.character?.comics.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicCell", for: indexPath) as! ComicTableViewCell
        
        let comic = self.character?.comics[indexPath.row]
        cell.setData(forComic: comic!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
    
}
