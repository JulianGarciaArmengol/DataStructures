//
//  DicView.swift
//  DS
//
//  Created by julian.garcia on 17/07/24.
//

import SwiftUI

struct DicView: View {
    @State private var target: String = "9"
    @State private var input: String = "2,7,11,15"
    
    @State private var result: [Int] = []
    
    var body: some View {
        VStack {
            Text("Two Sum")
                .font(.title)
            Form {
                Section("Datos") {
                    VStack(alignment: .leading) {
                        Text("Target")
                        TextField("Target", text: $target)
                    }
                    VStack(alignment: .leading) {
                        Text("Input")
                        TextField("input", text: $input,  axis: .vertical)
                            .lineLimit(5...10)
                    }
                }
                
                Button("Calculate") {
                    guard !target.isEmpty else { return }
                    guard !input.isEmpty else { return }
                    
                    let input = getInputArray()
                    let target = Int(target)!
                    let indexs = twoSum(input, target)
                    
                    result = indexs.map{ input[$0] }
                }
                
                Section("Result") {
                    
                    Text(result.isEmpty ? "Lets Calculate!" : "\(result.description) = \(target)")
                }
            }
        }
    }
    
    func getInputArray() -> [Int] {
        let arr = input.components(separatedBy: ",")
        return arr.compactMap { Int($0) }
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        
        for i in 0..<nums.count {
            let aux = target - nums[i]
            
            if let y = dic[nums[i]] {
                return [y, i]
            }
            
            dic[aux] = i
        }
        
        return []
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

#Preview {
    DicView()
}
