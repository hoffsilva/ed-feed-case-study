//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Hoff Henry Pereira da Silva on 11/12/20.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
