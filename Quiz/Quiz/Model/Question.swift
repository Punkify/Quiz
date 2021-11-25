//
//  Question.swift
//  Quiz
//
//  Created by Developer on 25/11/21.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String){
        text = q
        answer = a
    }
}
