//
//  FAQCellModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/30/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class FAQCellModel{
    var question: String
    var description: String
    var example: String?
    init(question: String, description: String, example: String?) {
        self.question = question
        self.description = description
        self.example = example
    }
}
