//
//  POSTDATA.swift
//  H4XOR News
//
//  Created by Adebayo Sotannde on 9/20/22.
//


struct Results: Decodable
{
    let hits: [Post]
}

struct Post: Decodable, Identifiable
{
    var id: String //calculated
    {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
