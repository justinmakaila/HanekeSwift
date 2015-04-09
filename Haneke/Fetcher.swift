//
//  Fetcher.swift
//  Haneke
//
//  Created by Hermes Pique on 9/9/14.
//  Copyright (c) 2014 Haneke. All rights reserved.
//

import UIKit

// See: http://stackoverflow.com/questions/25915306/generic-closure-in-protocol
public class Fetcher<T : DataConvertible> {

    public let key : String
    
    init(key : String) {
        self.key = key
    }
    
    public func fetch(failure fail : ((NSError?) -> ()), success succeed : (T.Result) -> ()) {}
    
    public func cancelFetch() {}
}

public class SimpleFetcher<T : DataConvertible> : Fetcher<T> {
    
    let value: () -> T.Result
    
    public init(key : String, @autoclosure(escaping) value: () -> T.Result) {
        self.value = value
        super.init(key: key)
    }
    
    override public  func fetch(failure fail : ((NSError?) -> ()), success succeed : (T.Result) -> ()) {
        succeed(value())
    }
    
    override public func cancelFetch() {}
    
}
