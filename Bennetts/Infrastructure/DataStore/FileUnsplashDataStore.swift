//
//  FileUnsplashDataStore.swift
//  Bennetts
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

public class FileUnsplashDataStore: UnsplashDataStore {

    enum UnsplashDataStoreError: Error {
        case noDocumentDirectory
        case noData
        case delete
    }

    // MARK: - Properties
    private var docsURL: URL? {
        return fileManager.urls(for: FileManager.SearchPathDirectory.documentDirectory,
                                in: FileManager.SearchPathDomainMask.allDomainsMask).first
    }

    private let fileManager: FileManager
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let path = "unsplashImages.json"

    // MARK: - Methods
    public init(fileManager: FileManager = .default, encoder: JSONEncoder, decoder: JSONDecoder) {
        self.fileManager = fileManager
        self.encoder = encoder
        self.decoder = decoder
    }

    func saveImages(images: [UnsplashPhoto]) async throws {
        guard let docsURL = docsURL else {
            throw UnsplashDataStoreError.noDocumentDirectory
        }

        let jsonData = try encoder.encode(images)
        try jsonData.write(to: docsURL.appendingPathComponent(path))
    }

    func getImages() async throws -> [UnsplashPhoto] {
        guard let docsURL = docsURL else {
            throw UnsplashDataStoreError.noDocumentDirectory
        }

        guard let jsonData = try? Data(contentsOf: docsURL.appendingPathComponent(path)) else {
            throw UnsplashDataStoreError.noData
        }
        let photos = try! decoder.decode([UnsplashPhoto].self, from: jsonData)
        return photos
    }

    func deleteAllImages() async throws {
        guard let docsURL = docsURL else {
            throw UnsplashDataStoreError.noDocumentDirectory
        }

        do {
            try fileManager.removeItem(at: docsURL.appendingPathComponent(path))
        } catch {
            throw UnsplashDataStoreError.delete
        }
    }
}
