//
//  ListElementView.swift
//  Todo
//
//  Created by carrizane on 2/1/22.
//

import SwiftUI

struct ListElementView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .gray)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListElementView_Previews: PreviewProvider {
    
    static var itemTrue = ItemModel(title: "First True Item", isCompleted: true)
    static var itemFalse = ItemModel(title: "Second False Item", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListElementView(item: itemTrue)
            ListElementView(item: itemFalse)
        }
        .previewLayout(.sizeThatFits)
    }
}
