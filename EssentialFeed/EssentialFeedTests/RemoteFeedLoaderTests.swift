//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Hoff Henry Pereira da Silva on 11/12/20.
//

import XCTest

class RemoteFeedLoader {
    
    private let url: URL?
    private let client: HTTPClient
    
    init(url: URL?,
         client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL: URL?
    
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: nil, client: client)
        XCTAssertNil(client.requestedURL)
        
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "www.google.com.br")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }

}
