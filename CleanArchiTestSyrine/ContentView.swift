//
//  ContentView.swift
//  CleanArchiTestSyrine
//
//  Created by Syrine DRIDI on 20/06/2023.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var vm = TreeListViewModel()
    
        var body: some View {
            List {
                if( vm.trees?.isEmpty == false){
                    ForEach(vm.trees!) { item in
                        Text(item.fields.espece)
                        Text(item.fields.libellefrancais)
                    }
                }
            }
        .navigationTitle("Tree List")
        .task {
           await vm.getTreeList()
        }
        .alert("Error", isPresented: $vm.hasError) {
        } message: {
            Text(vm.errorMessage)
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
