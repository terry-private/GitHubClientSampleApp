//
//  SwiftUIView.swift
//  
//
//  Created by cw-teruhito.wakae on 2023/10/04.
//

import SwiftUI
import Components
import Entity
import NukeUI

public extension SearchView {
    struct Cell: View {
        private let repository: SearchedRepository
        
        public init(repository: SearchedRepository) {
            self.repository = repository
        }
        
        public var body: some View {
            VStack(alignment: .leading, spacing: 9) {
                HStack {
                    LazyImage(url: repository.owner.avatarURL) { state in
                        if let image = state.image {
                            image.resizable().aspectRatio(contentMode: .fill)
                        }
                    }
                    .frame(width: 25, height: 25)
                    .clipped()
                    .cornerRadius(4)
                    
                    Text(repository.owner.name ?? "")
                        .font(.callout)
                        .opacity(0.8)
                }
                
                Text(repository.name)
                    .font(.headline)
                
                Text(repository.description ?? "")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 15) {
                    HStack(spacing: 5) {
                        Image(systemName: "star")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                        
                        Text(repository.stargazerCount.description)
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 5) {
                        Circle()
                            .fill(Color(hex: repository.primaryLanguage?.color ?? "") ?? .clear)
                            .frame(width: 12, height: 12)
                        Text(repository.primaryLanguage?.name ?? "")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
            }
            .frame(maxHeight: 230)
            .padding(7)
        }
    }
}

struct SearchViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchView.Cell(repository: .forPreview)
    }
}
