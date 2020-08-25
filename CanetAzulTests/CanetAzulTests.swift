//
//  CanetAzulTests.swift
//  CanetAzulTests
//
//  Created by Kellyane Nogueira on 12/08/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import XCTest
@testable import CanetAzul

class StorageTests: XCTestCase { //Nome da classe testada

    func test_createFile_creatingNewText_returnTrue(){ //test_nomedafuncaotestada_estadodoTeste_retornoEsperado
        //given
        let sut = Storage()
        //when
        let text = Text(titleText: "title", textBody: "Body")
        var result = sut.createFile(text)
        //Then
        XCTAssertTrue(result)
        
    }
    
    func test_updateFile_updatingSaveText_returnTrue(){
        //given
        let sut = Storage()
        //when
        let text = Text(titleText: "title", textBody: "Body")
        sut.createFile(text)
        let idText = text.id
        let result = sut.updateFile(idText)
        //then
        XCTAssertTrue(result)
    }
    
    func test_readFile_readingSavedFile_returnNotNil(){
        //given
        let sut = Storage()
        //when
        let text = Text(titleText: "title", textBody: "Body")
        sut.createFile(text)
        let idText = text.id
        let result = sut.readFile(idText)
        //then
        XCTAssertNotNil(result)
    }
    
    func test_readAllFiles_readingAllSavedFiles_returnNotNil(){
        //given
        let sut = Storage()
        //when
        let textSaved = Text(titleText: "title", textBody: "Body")
        sut.createFile(textSaved)
        var texts: [Text] = []
        texts.append(textSaved)
        var result: [Text] = sut.readAllFiles() ?? []
        //then
        XCTAssertNotNil(result)
    }
    
    func test_deleteFile_deletingFile_returnTrue(){
        //given
        let sut = Storage()
        //when
        var text = Text(titleText: "title", textBody: "Body")
        sut.createFile(text)
        var idText = text.id
        let result = sut.deleteFile(idText)
        //then
        XCTAssertTrue(result)
    }
    
}
