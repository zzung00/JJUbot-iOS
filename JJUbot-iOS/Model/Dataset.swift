//
//  Dataset.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/03/26.
//

import Foundation

struct XMain {
    var root: Root
}

// MARK: - Root
struct Root {
    var parameters: Parameters
    var dataset = [Dataset]()
    let xmlns: String
}

// MARK: - Dataset
struct Dataset {
    var columnInfo: ColumnInfoUnion
    var rows: RowsUnion
    var id: String
}

enum ColumnInfoUnion {
    case columnInfoClass(ColumnInfoClass)
    case string(String)
}

// MARK: - ColumnInfoClass
struct ColumnInfoClass {
    var column = [Column]()
}

// MARK: - Column
struct Column {
    var id: String
    var type: TypeEnum
    var size: String
}

enum TypeEnum {
    case int
    case string
}

enum RowsUnion {
    case rowsClass(RowsClass)
    case string(String)
}

// MARK: - RowsClass
struct RowsClass {
    var row: Row
}

// MARK: - Row
struct Row {
    var col = [Parameter]()
}

// MARK: - Parameter
struct Parameter {
    var id, text: String
}

// MARK: - Parameters
struct Parameters {
    var parameter = [Parameter]()
}
