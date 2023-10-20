//
//  ViewController.swift
//  MyCollectionView
//
//  Created by ali on 2023-10-20.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    let cellID = "Cell"
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        31
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath.row)
        }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MyCell
        cell.daylabel.text = "Rectangle " + String(1 + indexPath.row) 
        cell.myTextLabel.text = String(indexPath.row) + "M"
        cell.layer.cornerRadius = 5
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 40, left: 10, bottom: 15, right: 10)
        layout.itemSize = CGSize(width: (view.frame.width - 60)/2, height: view.frame.height / 10)
        let rect = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: view.frame.height - 30)
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layer.cornerRadius = 25
        collectionView.layer.masksToBounds = true
        self.view.addSubview(collectionView)
    }

}

