//
//  PhoneDropDownView.swift
//  ERide
//
//  Created by Macmaurice Osuji on 4/15/24.
//

import SwiftUI
import Combine

struct PhoneDropDownView: View {
    
    @State var countryCode : String = "+1"
    @State var countryFlag : String = "🇺🇸"
    @State var countryPattern : String = "### ### ####"
    @State var mobPhoneNumber = ""
    @State private var searchCountry: String = ""
    @State var presentSheet = false
    @FocusState private var keyIsFocused: Bool
    
    @Binding var PhoneNumber: String
    
    let countries: [CountryDataModel] = Bundle.main.decode("countryData.json")
    
    var filteredResorts: [CountryDataModel] {
        if searchCountry.isEmpty {
            return countries
        } else {
            return countries.filter { $0.dial_code.contains(searchCountry) || $0.name.contains(searchCountry)}
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        presentSheet = true
                        keyIsFocused = false
                    } label: {
                        HStack {
                            Text(countryFlag)
                            Image(systemName: "chevron.down")
                        }
                        .padding(10)
                        .frame(minHeight: 47)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1))
                        .foregroundColor(.accentColor)
                    }
                    HStack(spacing: 5) {
                        Text(countryCode)
                        TextField("Enter phone number", text: $mobPhoneNumber)
                            .padding(.bottom, 1)
                            .focused($keyIsFocused)
                            .keyboardType(.numbersAndPunctuation)
                            .onReceive(Just(mobPhoneNumber)) { _ in
                                applyPatternOnNumbers(&mobPhoneNumber, pattern: countryPattern, replacementCharacter: "#")
                                completeNumber()
                            }
                        
                    }
                    .padding(10)
                    .frame(minHeight: 47)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }
                .padding(.top)
            }
        }
        .sheet(isPresented: $presentSheet) {
            NavigationView {
                List(filteredResorts) { country in
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                            .font(.subheadline)
                        Spacer()
                        Text(country.dial_code)
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        countryFlag = country.flag
                        countryCode = country.dial_code
                        countryPattern = country.pattern
                        presentSheet = false
                        searchCountry = ""
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchCountry, prompt: "Search for your country")
            }
            .presentationDetents([.medium, .medium])
        }
    }
    func completeNumber() {
        PhoneNumber = countryCode + " " + mobPhoneNumber
    }
}

struct PhoneDropDownView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneDropDownView(PhoneNumber: .constant(""))
    }
}

