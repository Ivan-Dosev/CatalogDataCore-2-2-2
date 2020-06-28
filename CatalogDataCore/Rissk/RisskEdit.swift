//
//  RisskEdit.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 22.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct RisskEdit: View {
    
    
         var onEditingChanged: (Bool) -> Void = {_ in}
         var onCommit:() -> Void = {}
         
        var floatFormatter : NumberFormatter = {
             let float = NumberFormatter()
             float.numberStyle = .decimal
             return float
         }()
         @Environment(\.presentationMode) var pMode
         @Environment(\.managedObjectContext) var moc
         @ObservedObject var rilka : Rekarstvo
    
        
      @State   var id         : Int       = 0
      @State   var lekarstvo  : String    = ""
      @State   var isOnLek    : Bool      = false
         
      @State   var risk       : String     = ""
      @State   var proper     : String     = ""
      @State   var dosage     : String     = ""
      @State   var careful    : String     = ""
      @State   var effects    : String     = ""
    
    var body: some View {
            Form {
                Section {
                        TextField("risk  ...", text: self.$risk)
                              .padding()
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                              .shadow(color: .gray, radius: 5)
                    
                        TextField("proper  ...", text: self.$proper)
                               .padding()
                               .clipShape(RoundedRectangle(cornerRadius: 10))
                               .shadow(color: .gray, radius: 5)
                    
                        TextField("dosage  ...", text: self.$dosage)
                               .padding()
                               .clipShape(RoundedRectangle(cornerRadius: 10))
                               .shadow(color: .gray, radius: 5)
                    
                        TextField("careful  ...", text: self.$careful)
                               .padding()
                               .clipShape(RoundedRectangle(cornerRadius: 10))
                               .shadow(color: .gray, radius: 5)
                    
                         TextField("effects  ...", text: self.$effects)
                               .padding()
                               .clipShape(RoundedRectangle(cornerRadius: 10))
                               .shadow(color: .gray, radius: 5)
                    
                       }
                Section {
                        TextField("lekarstvo ...", text: self.$lekarstvo)
                                      .padding()
                                      .clipShape(RoundedRectangle(cornerRadius: 10))
                                      .shadow(color: .gray, radius: 5)
                     }
                
                Section {
                    
                    HStack {
                             Spacer()
                        Button(action: { self.addItem()
                                         self.pMode.wrappedValue.dismiss()
                             }) {
                                  Text("Save to CoreData")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(.blue))
                                    }
                             Spacer()
                          }
                     }
                
            }.onAppear() {
                self.lekarstvo =  self.rilka.lekarstvo!
                self.risk      =  self.rilka.risk!
                self.proper    =  self.rilka.proper!
                self.dosage    =  self.rilka.dasage!
                self.careful   =  self.rilka.careful!
                self.effects   =  self.rilka.effects!
    
                }
 
    }

     func saveItem() {
           do{
               try? moc.save()
           }catch{print(error)}
       }
       
       func addItem() {
     
          self.rilka.lekarstvo    = self.lekarstvo
          self.rilka.risk         = self.risk
          self.rilka.proper       = self.proper
          self.rilka.dasage       = self.dosage
          self.rilka.careful      = self.careful
          self.rilka.effects      = self.effects
     
             saveItem()
       }
}

struct RisskEdit_Previews: PreviewProvider {
    static var previews: some View {
        RisskEdit(rilka: Rekarstvo())
    }
}
