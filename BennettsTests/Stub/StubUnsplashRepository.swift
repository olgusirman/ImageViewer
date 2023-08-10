//
//  StubUnsplashRepository.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation
@testable import Bennetts

final class StubUnsplashRepository: UnsplashRepository {

    func getImages() async throws -> [Bennetts.UnsplashPhoto] {
        .mockRepositoryPhotos
    }
}
