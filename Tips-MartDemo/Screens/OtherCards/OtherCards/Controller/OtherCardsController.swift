//
//  OtherCardsController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class OtherCardsController: UIViewController {
    
    @IBOutlet weak var colletctionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
  
    var delegateForCollectionView = OtherCardsDSD()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
       
    }
  
    
    func setDelegate(){
        delegateForCollectionView.collectionView = colletctionView
        colletctionView.delegate = delegateForCollectionView
        colletctionView.dataSource = delegateForCollectionView
        searchBar.delegate = delegateForCollectionView
        delegateForCollectionView.createNewCard = { [weak self] in
            let vc = UIStoryboard(name: "AddCard", bundle: nil).instantiateViewController(withIdentifier: "addCrdVc") as! AddCartController
            self?.present(vc, animated: true, completion: nil)
        }
        
    }
    // Gesture to hide keyboard
    func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleEndEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleEndEditing(){
        view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegateForCollectionView.collectionView.reloadData()
    }
    
    
    //MARK: - IBAction stack
    @IBAction func myCardBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "BarCode", bundle: nil).instantiateViewController(withIdentifier: "BarCodeVC") as! BorCodeGenViewController
        vc.senderIs = .otherCards
        present(vc, animated: true) {
            UIScreen.main.brightness = 1.0
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

