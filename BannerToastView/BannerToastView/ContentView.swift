//
//  ContentView.swift
//  BannerToastView
//
//  Created by Rajeev Yadav on 03/06/23.
//

import SwiftUI


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


struct CustomScreen: View {
    
    @State private var showView: Bool = false
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack {
                Spacer()
                Button("Show Alert") {
                    withAnimation {
                        showView.toggle()
                    }
                }
                .modifier(Title())
                Spacer()
            }
            
            if showView {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.1)
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
                        // you can add this effect also removal: AnyTransition.identity.animation(.easeInOut)
                }
                
                VStack{
                    Text("Alert Banner!!!")
                        .padding(10)
                    Text("Content to display!!")
                        .onReceive(timer) { input in
                            showView = false
                        }


                }
                
            }
            
            
        }
    }
}



struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Text("My app")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "person")
                    HStack {
                        Image(systemName: "ellipsis")
                        Divider()
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                    }
                }
            }
        }

        
        
//        VStack{
//            CustomScreen()
//        }
//        .animation(.easeInOut)
//        .transition(.move(edge: .top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
