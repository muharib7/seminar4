//
//  MyCellCollectionViewCell.swift
//  MyCollectionView
//
//  Created by ali on 2023-10-20.
//

import UIKit

class MyCell: UICollectionViewCell {

    let daylabel: UILabel={
        
        let control = UILabel()
        control.textColor = UIColor.white
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
//        let control = UIFont.system
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    let myTextLabel:UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 16)
        control.textColor = .red
        control.text = "Ali"
        control.textColor = .red
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    private func addView(){
        backgroundColor = UIColor.blue
        addSubview(myTextLabel)
        addSubview(daylabel)
        
        daylabel.pinCenter(to: self)
        myTextLabel.pinLeft(to: self)
        
        
        
    }
}
