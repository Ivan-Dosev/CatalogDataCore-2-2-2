//
//  Firms.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 28.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI
import CoreData

struct Firms: View {
    
    @Environment(\.managedObjectContext) var moC : NSManagedObjectContext
    @FetchRequest(entity: Becarstvo.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Becarstvo.nameLecarstvo, ascending: true)
       ]) var barda : FetchedResults<Becarstvo>
    
    @ObservedObject var firma = Firma()
    @State var isSave : Bool = false

    var body: some View {
        NavigationView {
            List {
                 ForEach( barda , id: \.nameFirm ) { big in
                    
                    
                    NavigationLink(destination: EditFirm(milka: big)) {
                        Text("\(big.nameLecarstvo ?? "")")
                    }
                }
            .onDelete(perform: deleteItem )
            }
            
           .navigationBarTitle(Text("Catalog Firms"))

            .navigationBarItems(leading:  Button(action: {self.getAllData()}) {
                                          Text("Save To JSON")
                } ,
                                trailing:  Button(action: {self.isSave.toggle()}) {
                                           Image(systemName: "plus.circle.fill")
            } )
                .sheet(isPresented: $isSave )  {FirmsAdd().environment(\.managedObjectContext, self.moC)}
        
        }
      
    }
    
    func deleteItem(indexSet: IndexSet) {
        let note = barda[indexSet.first!]
            moC.delete(note)
            saveItem()
    }
    
    func saveItem() {
        do{
            try? moC.save()
        }catch{print(error)}
    }
    
   
     func getAllData() {
           
          var user: [Becarstvo] = []
        
           do{
                    user =  try moC.fetch(Becarstvo.fetchRequest())
          
           }catch{
                   print(error)
           }
        
         for data in user as! [NSManagedObject] {
             
            let dossi = Mecarstvo(id: data.value(forKey: "id") as! Int,
                                  nameLecarstvo: data.value(forKey: "nameLecarstvo") as! String,
                                  nameFirma: data.value(forKey: "nameFirm") as! String,
                                  vidove: data.value(forKey: "vidove") as! String,
                                  optinal: data.value(forKey: "optinal") as! String)

                     self.firma.database100.append(dossi)

         }
  

        guard let encoded = try? JSONEncoder().encode(firma.database100) else {return}
            
            let jsonString = String(data: encoded, encoding: .utf8)
          
            let file = "/Users/IvanDosevDimitrov/Desktop/CatalgFirms.txt"
          
            do{
                
                try jsonString?.write(toFile: file, atomically: true, encoding: .utf8)
                
            }catch{
                    print("error ...")
            }

         }

    
}

struct Firms_Previews: PreviewProvider {
    static var previews: some View {
        Firms()
    }
}
