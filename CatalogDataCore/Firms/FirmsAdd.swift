//
//  FirmsAdd.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 30.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct FirmsAdd: View {
    
    var onEditingChanged: (Bool) -> Void = {_ in}
    var onCommit:() -> Void = {}
    
    private var floatFormatter : NumberFormatter = {
        let float = NumberFormatter()
        float.numberStyle = .decimal
        return float
    }()
    @Environment(\.presentationMode) var pMode
    @Environment(\.managedObjectContext) var moC
    
   @State var nameLecarstvo : String = ""
   @State var nameFirma     : String = ""
   @State var vidove        : String = ""
   @State var optinal      : String = ""
    
    var body: some View {
        
       Form {
            Section {
                     TextField("име на лекарство  ...", text: self.$nameLecarstvo)
                         .padding()
                         .clipShape(RoundedRectangle(cornerRadius: 10))
                         .shadow(color: .gray, radius: 5)
                      TextField("име на Фирма  ...", text: self.$nameFirma)
                          .padding()
                          .clipShape(RoundedRectangle(cornerRadius: 10))
                          .shadow(color: .gray, radius: 5)
            }
        Section {
                 TextField("видиве  ...", text: self.$vidove)
                     .padding()
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                     .shadow(color: .gray, radius: 5)
                  TextField("optional  ...", text: self.$optinal)
                      .padding()
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                      .shadow(color: .gray, radius: 5)
           }
        Section {
            
            HStack {
                Spacer()
                Button(action: {self.addItem()
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
        
        }
        
       
    }
    
    
      func saveItem() {
          do{
              try? moC.save()
          }catch{print(error)}
      }
      
      func addItem() {
                   let add = Becarstvo(context: self.moC)

                   add.nameLecarstvo = self.nameLecarstvo
                   add.nameFirm      = self.nameFirma
                   add.vidove        = self.vidove
                   add.optinal       = self.optinal
    
            saveItem()
      }
     
}

 struct FirmsAdd_Previews: PreviewProvider {
     static var previews: some View {
         FirmsAdd()
     }
 }
 
