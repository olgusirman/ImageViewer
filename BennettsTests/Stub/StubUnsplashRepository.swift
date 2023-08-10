//
//  StubUnsplashRepository.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import Foundation

final class StubUnsplashRepository: UnsplashRepository {
    func getImages() async throws -> [Bennetts.UnsplashPhoto] {
        .mockRepositoryPhotos
    }
}
