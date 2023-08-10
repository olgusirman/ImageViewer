//
//  StubUnsplashRemoteAPI.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

@testable import Bennetts
import Foundation

final class StubUnsplashRemoteAPI: UnsplashRemoteAPI {
    func fetchImages() async throws -> [UnsplashPhoto] {
        let photos: [UnsplashPhoto] = try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                let photos: [Bennetts.UnsplashPhoto] = .mockRemoteAPIPhotos
                continuation.resume(returning: photos)
            }
        }

        return photos
    }
}
