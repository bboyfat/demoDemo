//
//  OtherCardsDSD.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class OtherCardsDSD: NSObject, UICollectionViewDataSource{
    
    var collectionView: UICollectionView!
    var viewModel: OtherCardsVieModelProtocol!
    let layout = UICollectionViewFlowLayout()
    var footerHeigth: CGFloat = 0
    var isOpen = false
    var section: Int = 0
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return viewModel.sectionsCount()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.itemsCount(with: section)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < viewModel.itemsCount(with: indexPath.section){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
            let model = viewModel.getModel(with: indexPath)
            cell.imageView.image = model.logoImage
            return cell
        } else {
            let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCardCell", for: indexPath) as! AddCardCell
            return addCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let nib = UINib.init(nibName: "DetailFooterView", bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "detailFooter")
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "detailFooter", for: indexPath) as! DetailFooterView
        
        return footerView
    }
    
    
    
    override init() {
        super.init()
        viewModel = OtherCardsViewModel()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == self.section{
            return CGSize(width: collectionView.frame.width , height: footerHeigth)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    
}

extension OtherCardsDSD: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isOpen = !isOpen
        self.section = indexPath.section
        if isOpen{
            footerHeigth = 350
            let set = IndexSet(integer: indexPath.section)
            collectionView.reloadSections(set)
        } else{
            footerHeigth = 0
            let set = IndexSet(integer: indexPath.section)
            collectionView.reloadSections(set)
        }
        
    }
    
    
}

extension OtherCardsDSD: UICollectionViewDelegateFlowLayout{
    
}
