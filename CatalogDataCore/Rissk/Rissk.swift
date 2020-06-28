//
//  Rissk.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 22.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI
import CoreData
import Combine

struct Rissk: View {

    @Environment(\.managedObjectContext) var moc : NSManagedObjectContext
    @FetchRequest(entity: Rekarstvo.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Rekarstvo.lekarstvo, ascending: true)]) var rilka : FetchedResults<Rekarstvo>
    @State  var isSave : Bool = false
    @ObservedObject var catOpis = CatOpis()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(rilka , id: \.lekarstvo ) { item in
                    NavigationLink(destination: RisskEdit(rilka: item)) {
                         Text("\(item.lekarstvo ?? "")")
                    }
                }
                .onDelete(perform: deleteItem )
            }
            .navigationBarTitle(Text("Risk,Dosage,Effects"))
            .navigationBarItems(leading:  Button(action: {self.getAllData()}) { Text("Save To JSON")},
                                trailing:  Button(action: {self.isSave.toggle()}) { Image(systemName: "plus.circle.fill")})
            .sheet(isPresented: $isSave )  {RisskAdd().environment(\.managedObjectContext, self.moc)}
        }
    }
    
     func deleteItem(indexSet: IndexSet) {
         let note = rilka[indexSet.first!]
             moc.delete(note)
             saveItem()
     }
     
     func saveItem() {
         do{
             try? moc.save()
         }catch{print(error)}
     }
    
      
        func getAllData() {
              
             var user: [Rekarstvo] = []
           
              do{
                       user =  try moc.fetch(Rekarstvo.fetchRequest())
             
              }catch{
                      print(error)
              }
           
            for data in user as! [NSManagedObject] {
                let dossi = Opis(id: data.value(forKey: "id") as! Int,
                                 lekarstvo: data.value(forKey: "lekarstvo") as! String,
                                 isOnLek: data.value(forKey: "isOnLek") as! Bool,
                                 risk: data.value(forKey: "risk") as! String,
                                 proper: data.value(forKey: "proper") as! String,
                                 dosage: data.value(forKey: "dasage") as! String,
                                 careful: data.value(forKey: "careful") as! String,
                                 effects: data.value(forKey: "effects") as! String)

                        self.catOpis.dataOpis.append(dossi)


            }
///Users/IvanDosevDimitrov/Desktop/CatalogRisk.txt
           guard let encoded = try? JSONEncoder().encode(catOpis.dataOpis) else {return}
               
               let jsonString = String(data: encoded, encoding: .utf8)
             
               let file = "Users/IvanDosevDimitrov/Desktop/CatalogRisk.txt"
             
               do{
                   
                   try jsonString?.write(toFile: file, atomically: true, encoding: .utf8)
                   
               }catch{
                       print("error ...")
               }

            }

    
     
}

struct Rissk_Previews: PreviewProvider {
    static var previews: some View {
        Rissk()
    }
}
