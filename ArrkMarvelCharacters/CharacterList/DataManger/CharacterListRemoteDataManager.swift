//
//  CharacterListRemoteDataManager.swift
//  ArrkMarvelCharacters
//
//  Created by Priyanka Mistry on 18/06/18.
//  Copyright © 2018 Priyanka Mistry. All rights reserved.
//


import Foundation
import Alamofire

class CharacterListRemoteDataManager:CharacterListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: CharacterListRemoteDataManagerOutputProtocol?
    
    func retrieveCharacterList() {
        let url = EndPoints.Characters.fetch.url
        Alamofire
            .request(url, method: .get)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                case .success(let _):
                    
                    var characterArray = [CharacterModel]()
                    if let results = response.value as? Dictionary<String,Any> {
                        if let dataList = results["data"] as? Dictionary<String,Any> {
                            if let characterList = dataList["results"] as? [Dictionary<String,Any>] {
                                
                                for character in characterList {
                                    
                                    var imagePath = ""
                                    var characterComics = [ComicModel]()
                                    let id = character["id"] as? Int
                                    let characterName = character["name"] as? String
                                    let description = character["description"] as? String
                                    
                                    if let thumbnail = character["thumbnail"] as? Dictionary<String,String> {
                                        if let path = thumbnail["path"], let exten = thumbnail["extension"] {
                                            imagePath = path.stringByAppendingPathExtension(ext: exten)!
                                        }
                                    }
                                    
                                    if let comics = character["comics"] as? Dictionary<String,Any> {
                                        if let items = comics["items"] as? [Dictionary<String,String>]  {
                                            for item in items {
                                                
                                                let comic = ComicModel.init(name: item["name"]!)
                                                characterComics.append(comic)
                                            }
                                        }
                                    }
                                    
                                    let model = CharacterModel.init(id: id!, name: characterName!, description: description!, thumbImageUrl: imagePath, comics: characterComics)
                                    characterArray.append(model)
                                    
                                }
                            }
                        }
                    }
                    
                    self.remoteRequestHandler?.onCharactersRetrieved(characterArray)
                    
                case .failure(_):
                    self.remoteRequestHandler?.onError()
                }
        }
        
    }
    
}
