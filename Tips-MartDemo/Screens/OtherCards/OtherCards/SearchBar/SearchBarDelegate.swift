
//
//  SearchBarDelegate.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/19/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol SearchBarProtocol {
    func returnFilteredItems() -> [OtherCardsModel]
}

class SearchBarDelegate: NSObject, UISearchBarDelegate{
    
    var items: [OtherCardsModel] = []
    var filtered: [OtherCardsModel] = []
    var searchActive : Bool = false
    
    var showFiltered: ([OtherCardsModel]) -> () = {_ in}
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        filtered = items.filter({ (item) -> Bool in
            let countryText: NSString = item.cardName as NSString
            return (countryText.range(of: searchBar.text ?? "", options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        showFiltered(filtered)
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if !searchActive{
            searchActive = true
        }
        searchBar.resignFirstResponder()
    }
    private func fetchItems(items: [OtherCardsModel]){
        self.items = items
    }
   
}

extension SearchBarDelegate: SearchBarProtocol{
    
    func returnFilteredItems() -> [OtherCardsModel] {
        return filtered
    }
    
    
}
