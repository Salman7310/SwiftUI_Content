//
//  ValidationSummaryView.swift
//  FormValidation_SummaryView
//
//  Created by Salman_Macbook on 23/05/24.
//

import SwiftUI

struct ValidationSummaryView: View {
    
    let errors: [LocalizedError]
    let isTextVisible: Bool
    
    var body: some View {
        if errors.isEmpty && isTextVisible {
            Text("Form Submitted")
                .font(.caption)
                .foregroundColor(.red)
        }
        ForEach(errors, id: \.id) { error in
            Text(error.localizedDescription)
                .font(.caption)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    ValidationSummaryView(errors: [], isTextVisible: false)
}
