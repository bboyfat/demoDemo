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
    var viewModel: OtherCardsVieModelProtocol!{
        didSet{
            self.collectionView.reloadData()
        }
    }
    let layout = UICollectionViewFlowLayout()
//    var indexPathForSelected: IndexPath = IndexPath(item: 0, section: 0)
    var footerHeigth: CGFloat = 0
    var isOpen = false
    var section: Int = 0
    var createNewCard: () -> () = { }
    var searchActive: Bool = false
    var barCodeGenerator = BarCodeGenerator()
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sectionsCount() + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == viewModel.sectionsCount(){
            return 1
        } else {
            return viewModel.itemsCount(with: section)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCardCell", for: indexPath) as! AddCardCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        if indexPath.section < viewModel.sectionsCount(){
            let model = viewModel.getModel(with: indexPath)
            cell.imageView.image = model.logoImage
            
            return cell
        } else if indexPath.section == viewModel.sectionsCount(){
            return addCell
        }
        return cell
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
        
        if indexPath.section == viewModel.sectionsCount(){
            createNewCard()
            return
        } else {
            isOpen = !isOpen
            section = indexPath.section
            if isOpen{
                footerHeigth = 320
                collectionView.reloadInputViews()
                let set = IndexSet(integer: indexPath.section)
                collectionView.reloadSections(set)
                collectionView.cellForItem(at: indexPath)?.isSelected = true
            } else{
                footerHeigth = 0
                
                let set = IndexSet(integer: indexPath.section)
                collectionView.reloadSections(set)
            }
        }
         let model = viewModel.getModel(with: indexPath)
        if let footerView = collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionFooter, at: IndexPath(item: 0, section: indexPath.section)) as? DetailFooterView{
           
            footerView.cardIdLabel.text = model.cardId
            footerView.cardNameLbl.text = model.cardName
            footerView.barCodeImage.image = barCodeGenerator.generateBrCode(from: model.cardId)
        }
        
    }
}

extension OtherCardsDSD: UICollectionViewDelegateFlowLayout{
    
}

extension OtherCardsDSD: UISearchBarDelegate{
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let text = searchBar.text{
            viewModel.sortingCards(text: text)
            collectionView.reloadData()
        }
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if !searchActive{
            searchActive = true
        }
        searchBar.resignFirstResponder()
    }
}
