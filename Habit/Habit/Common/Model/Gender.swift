//
//  Gender.swift
//  Habit
//
//  Created by David Arcari on 23/11/22.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
  case male = "Masculino"
  case female = "Feminino"
  
  var id: String {
    self.rawValue
  }
}
