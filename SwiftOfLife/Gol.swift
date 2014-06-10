//
//  Gol.swift
//  SwiftOfLife
//
//  Created by Parick De Marta on 10/06/14.
//  Copyright (c) 2014 Parick De Marta. All rights reserved.
//

class Gol {
    let rows: Int,
        columns: Int,
        livingCell: String,
        deadCell: String,
        neighborsPositions = [
            [-1,-1],[-1,0],[-1,1],
            [0,-1],[0,1],
            [1,-1],[1,0],[1,1]
        ]
        
    
    var grid: Bool[]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(count: rows * columns, repeatedValue: false)
        
        self.livingCell = "O"
        self.deadCell = "·"
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Bool {
        get {
            if indexIsValidForRow(row, column: column) {
                return grid[(row * columns) + column]
            } else {
                return false
            }
        }
        
        set {
            if indexIsValidForRow(row, column: column) {
                grid[(row * columns) + column] = newValue
            }
        }
    }
    
    func aliveNeighborsOf(#row : Int, column: Int) -> Int{
        var counter = 0
        for position in neighborsPositions {
            var r = row + position[0]
            var c = column + position[1]
            if self[r,c] { counter++ }
        }
        return counter
    }
    
    func render() -> String {
        var scene = ""
        var evolGrid : Bool[] = []
        for row in 0..rows {
            
            for col in 0..columns {
                var aCell = self[row,col]
                scene += aCell ? livingCell : deadCell
                var neighbors = aliveNeighborsOf(row: row, column: col)
                var newStatus = false
                if aCell {
                    if (neighbors == 2 || neighbors == 3) { newStatus = true}
                } else {
                    if neighbors == 3 { newStatus = true }
                }
                evolGrid.append(newStatus)
            }
            scene += "\n"
        }
        self.grid = evolGrid
        return scene
    }
    
    
}