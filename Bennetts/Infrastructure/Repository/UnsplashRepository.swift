//
//  UnsplashRepository.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

protocol UnsplashRepository {

    func getImages() async throws -> [UnsplashPhoto]
}
