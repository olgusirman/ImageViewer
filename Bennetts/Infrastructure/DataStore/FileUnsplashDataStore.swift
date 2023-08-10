//
//  FileUnsplashDataStore.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public class FileUnsplashDataStore: UnsplashDataStore {

    // MARK: - Properties
    private var docsURL: URL? {
        return FileManager
            .default.urls(for: FileManager.SearchPathDirectory.documentDirectory,
                          in: FileManager.SearchPathDomainMask.allDomainsMask).first
    }

    // MARK: - Methods
    public init() {}

    func saveImages(images: [UnsplashPhoto]) async throws {

    }

    func getImages() async throws -> [UnsplashPhoto] {
        []
    }
}
