//
//  ShopViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/26/22.
//

import Foundation
import UIKit

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Results]
}

struct Results: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let full: String
}

class PicViewController: UIViewController, UICollectionViewDataSource{
    
    let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=office&client_id=YR0m9hFX7XneLSp1txXIzO8l99ZBdZuSzL2SLPpbxY0"
    
    private var collectionView: UICollectionView?
    
    var results: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupShopBar()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(imageCollectionViewCell.self, forCellWithReuseIdentifier: imageCollectionViewCell.identifier)
        collectionView.dataSource = self
        view.addSubview(collectionView)
        self.collectionView = collectionView
        fetchPhotos()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    private func setupShopBar(){
        self.title = "Photos"
    }
    
    func fetchPhotos() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                 self?.results = jsonResult.results
                    self?.collectionView?.reloadData()
                }
               
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.full
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCollectionViewCell.identifier, for: indexPath)
                as? imageCollectionViewCell else {
                return UICollectionViewCell()
        }
        cell.configure(with: imageURLString)
        cell.backgroundColor = .blue
        return cell
    }
    
}
