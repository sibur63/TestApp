//
//  DataManager.swift
//  TestApp
//
//  Created by Сергей Аршинов on 07.03.2024.
//

import Foundation

protocol DataManagerDelegate: AnyObject {
    
    func dataManager(_ sender: DataManager, didUpdate value: Int, tableIndex: Int, collectionIndex: Int) async
}

class DataManager {
    
    weak var delegate: DataManagerDelegate?
    private var dataArray = [[Int]]()
    
    func getData() async -> [[Int]] {
        dataArray.removeAll()
        
        let vertical = Int.random(in: 100...200)
        
        for (index, _) in (0...vertical).enumerated() {
            dataArray.append([])
            let horizontal = Int.random(in: 10...30)
            
            for _ in 0...horizontal {
                let value = Int.random(in: 1...200)
                dataArray[index].append(value)
            }
        }
        
        return dataArray
    }
    
    func startUpdate() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            
            Task {
                await self.updateData()
            }
        })
        
        RunLoop.current.add(timer, forMode: .common)
    }
    
    private func updateData() async {
        for (tableIndex, _) in (0..<dataArray.count).enumerated() {
            let collectionIndex = Int.random(in: 0..<dataArray[tableIndex].count)
            let value = Int.random(in: 1...200)
            dataArray[tableIndex][collectionIndex] = value
                
            await delegate?.dataManager(self, didUpdate: value, tableIndex: tableIndex, collectionIndex: collectionIndex)
        }
    }
}
