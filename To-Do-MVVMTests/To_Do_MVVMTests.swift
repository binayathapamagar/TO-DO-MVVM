//
//  To_Do_MVVMTests.swift
//  To-Do-MVVMTests
//
//  Created by Binaya on 02/10/2021.
//

import XCTest
@testable import To_Do_MVVM

class To_Do_MVVMTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        // Testing the empty state:
        let emptyTodoVM = ToDoItemsViewModel.emptyState()
        XCTAssertTrue(emptyTodoVM.items.count == 0, "Should start with empty list of ToDo items.")
        emptyTodoVM.addItem()
        XCTAssertTrue(emptyTodoVM.items.count == 1, "There should be 1 ToDo item in the list.")

        // Testing the ViewModel with 3 items in the list:
        let todoVM = ToDoItemsViewModel.fullState()
        XCTAssertTrue(todoVM.items.count == 3, "Should start with list of 3 ToDo items.")
        todoVM.addItem()
        XCTAssertTrue(todoVM.items.count == 4, "There should be 4 ToDo items in the list.")
        
    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
