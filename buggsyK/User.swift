//
//  User.swift
//  buggsyK
//
//  Created by Felipe Montoya on 2/10/22.
//

import Foundation



struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    //TODO: Source Code - Expect different type
    let email: String
    let company: Company
}

extension User {
    struct Company: Decodable {
        let name: String
        let catchPhrase: String
    }
}


/*
 {
     "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
   }
 */
