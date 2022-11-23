//
//  HomeView.swift
//  Habit
//
//  Created by David Arcari on 23/11/22.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var viewModel: HomeViewModel
  
  var body: some View {
    Text("Aqui será a Home Screen...")
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(viewModel: HomeViewModel())
  }
}
