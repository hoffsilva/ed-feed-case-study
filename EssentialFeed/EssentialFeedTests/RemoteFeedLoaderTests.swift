//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Hoff Henry Pereira da Silva on 11/12/20.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestsDataFromURL() {
        let client = createSUT(with: nil).client
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "www.google.com")
        let (sut, client) = createSUT(with: url)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: Helpers
    
    private func createSUT(with url: URL? = URL(string: "www.google.com.br")) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        
        func get(from url: URL) {
            requestedURL = url
        }
        var requestedURL: URL?
        
    }

}
