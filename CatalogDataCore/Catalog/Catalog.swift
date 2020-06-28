//
//  Catalog.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 28.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI
import CoreData
import Combine

struct Catalog: View {
    
    @Environment(\.managedObjectContext) var moc : NSManagedObjectContext
    @FetchRequest(entity: Lekarstvo.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Lekarstvo.lekarstvo, ascending: true),
        NSSortDescriptor(keyPath: \Lekarstvo.grupa, ascending: true)]) var bilka : FetchedResults<Lekarstvo>
@State private var isSave : Bool = false
@ObservedObject var model = Model()

    
    
    var body: some View {
        
        NavigationView {
          List {
            
             ForEach( bilka , id: \.lekarstvo ) { big in
                NavigationLink(destination: EditCatallog(bilka: big)) {
                     Text("\(big.lekarstvo ?? "")")
                }
        /*
                NavigationLink(destination: EditItem(grupa: big.grupa!,
                                                     lekarstvo: big.lekarstvo!,
                                                     fromMin: big.fromMin,
                                                     toMin: big.toMin,
                                                     isMin: big.isMin,
                                                     fromMax: big.fromMax,
                                                     toMax: big.toMax,
                                                     isMax: big.isMax,
                                                     kgPazient: big.kgPazient,
                                                     goPazient: big.goPazient,
                                                     maxDoza: big.maxDoza,
                                                     firstDoza: big.firstDoza,
                                                     priemI: big.priemI,
                                                     priemII: big.priemII,
                                                     mjarka: big.mjarka!,
                                                     opis: big.opis!) ) {
                   Text("\(big.lekarstvo ?? "")")
              
                }
 */
              }
          .onDelete(perform: deleteItem )
              
          }
            
            
          .navigationBarTitle(Text("Catalog"))

          .navigationBarItems(leading: Button(action: {self.getAllData()}) {
                Text("Save To JSON")
            },
                                trailing: Button(action: {self.isSave.toggle()}) {
                 Image(systemName: "plus.circle.fill")
            })
            .sheet(isPresented: $isSave ) {AddNew().environment(\.managedObjectContext, self.moc)}
            
        }
       
    }
    
    func deleteItem(indexSet: IndexSet) {
        let note = bilka[indexSet.first!]
            moc.delete(note)
            saveItem()
    }
    
    func saveItem() {
        do{
            try? moc.save()
        }catch{print(error)}
    }
    
    func getAllData() {
          
         var userArr: [Lekarstvo] = []
       
          do{
                   userArr =  try moc.fetch(Lekarstvo.fetchRequest())
         
          }catch{
                  print(error)
          }
        
        for data in userArr as! [NSManagedObject] {
            let dossi = LecarstvO(id: data.value(forKey: "id") as! Int,
                                  kgPazient: data.value(forKey: "kgPazient") as! Int,
                                  goPazient: data.value(forKey: "goPazient") as! Int,
                                  fromMin: data.value(forKey: "fromMin") as! CGFloat,
                                  toMin: data.value(forKey: "toMin") as! CGFloat,
                                  fromMax: data.value(forKey: "fromMax") as! CGFloat,
                                  toMax: data.value(forKey: "toMax") as! CGFloat,
                                  isMin: data.value(forKey: "isMin") as! Bool,
                                  isMax: data.value(forKey: "isMax") as! Bool,
                                  mjarka: data.value(forKey: "mjarka") as! String,
                                  maxDoza: data.value(forKey: "maxDoza") as! CGFloat,
                                  firstDoza: data.value(forKey: "firstDoza") as! CGFloat,
                                  priemI: data.value(forKey: "priemI") as! Int,
                                  priemII: data.value(forKey: "priemII") as! Int,
                                  opis: data.value(forKey: "opis") as! String,
                                  lekarstvo: data.value(forKey: "lekarstvo") as! String,
                                  grupa: data.value(forKey: "grupa") as! String)
                         self.model.database.append(dossi)
        }
       
         guard let encoded = try? JSONEncoder().encode(model.database) else {return}
           
           let jsonString = String(data: encoded, encoding: .utf8)
         
           let file = "/Users/IvanDosevDimitrov/Desktop/CatalogLecarstvo.txt"
         
           do{
               
               try jsonString?.write(toFile: file, atomically: true, encoding: .utf8)
               
           }catch{
                   print("error ...")
           }

        }

}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        Catalog()
    }
}

/*
 var id: Int
 var kgPazient : Int       // килограми на пациента
 var goPazient : Int       // години на пациента
 var fromMin   : CGFloat        // диапазон ОТ в долната граница   ...  или килограми ..  или гогини на пациент
 var toMin     : CGFloat        // диапазон ДО в долната граница
 var fromMax   : CGFloat        // диапазон ОТ в горната граница граница   ...  или килограми ..  или гогини на пациент
 var toMax     : CGFloat        // диапазон ДО в горната граница
 var isMin     : Bool      //  ако е истина не се използва калкулатора
 var isMax     : Bool      //  ако е истина не се използва калкулатора
 var mjarka    : String    // мерна единица на лекарството
 var maxDoza   : CGFloat         // максимална диза изчислената стоиност нетрябва да е повече от максимална
 var firstDoza : CGFloat         // първа доза  първи ден на прием
 var priemI    : Int       // начин на прием на лекарството вариант първи
 var priemII   : Int       // начин на прием на лекарството вариант втори
 var opis      : String    // описание на приема в текст когато неможе да се калкулира
 var lekarstvo : String    // име на лекарството
 var grupa     : String    //  група на лекарството
 
 */
