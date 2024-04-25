//
//  DatePickers.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/15/24.
//

import SwiftUI

struct DatePickers: View {
    
    @Binding var dateOfBirth: Date
    @Binding var age: Int
    
    let startingDate = Calendar.current.date(from: DateComponents(year: 1900)) ?? Date()
    let endingDate = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack {
            DatePicker("Whats your date of birth?", selection: $dateOfBirth, in: startingDate...endingDate, displayedComponents:.date)
                .onChange(of: dateOfBirth) { _ in
                    calculateAge()
                }
        }
    }
    
    func calculateAge() {
        age = Calendar.current.dateComponents([.year],from: dateOfBirth,to: Date()).year ?? 0
    }
}

struct DatePickers_Previews: PreviewProvider {
    static var previews: some View {
        DatePickers(dateOfBirth: .constant(Date()), age: .constant(18))
    }
}
