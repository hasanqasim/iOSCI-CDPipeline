//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Hasan Qasim on 23/9/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    var entryUnderTest: Entry!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        entryUnderTest = nil
        super.tearDown()
    }
    
    func testFileEntryStoreSerializeAndDeserialize() {
        let serialize = FileEntryStore.serialize(entryUnderTest)
        let deserialize = FileEntryStore.deserialize(serialize!)
        
        XCTAssertEqual(deserialize!.title, "Title", "incorrect deserialization of entry title")
        XCTAssertEqual(deserialize!.content, "Content", "incorrect deserialziation of entry content")
    }


}
