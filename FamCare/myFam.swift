
import SwiftUI

struct myFam: View {
    var body: some View {
        ZStack {
            Color.backgroundPurple
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("Members (4)")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.top, 80)
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        HStack{
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.lightGrey)
                                    .frame(width: 180, height: 180)
                                VStack{
                                    Image("MumPic")
                                    Text("Mum (Admin)")
                                        .bold()
                                    HStack{
                                        Image(systemName: "eye.fill")
                                        Text("View Task")
                                    }
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.lightGrey)
                                    .frame(width: 180, height: 180)
                                VStack{
                                    Image("DadPic")
                                    Text("Dad")
                                        .bold()
                                    HStack{
                                        Image(systemName: "eye.fill")
                                        Text("View Task")
                                    }
                                }
                            }
                        }
                        .padding(.top)
                        
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.lightGrey)
                                    .frame(width: 180, height: 180)
                                VStack{
                                    Image("BrotherPic")
                                    Text("Jack")
                                        .bold()
                                    HStack{
                                        Image(systemName: "eye.fill")
                                        Text("View Task")
                                    }
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.lightGrey)
                                    .frame(width: 180, height: 180)
                                VStack{
                                    Image("SisterPic")
                                    Text("Sister")
                                        .bold()
                                    HStack{
                                        Image(systemName: "eye.fill")
                                        Text("View Task")
                                    }
                                }
                            }
                        }
                        VStack(spacing: -10) {
                            Text("Unique Family Code")
                                .bold()
                                .font(.title3)
                                .ignoresSafeArea()
                            
                            Image("FamilyCode")
                                .resizable()
                                .scaledToFit()
                                .padding(.top)
                                .ignoresSafeArea()
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(width: 350)
                                .foregroundColor(.lightGrey)
                        }
                        
                        HStack{
                            Button {
                                print("Poop :( ")
                            }
                        label: {
                            Text("Leave Group")
                                .padding()
                                .bold()
                                .font(.title3)
                                .foregroundStyle(.white)
                                .background{
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .foregroundStyle(.backgroundPink)
                                }
                        }.padding(.leading, 90)
                            Spacer()
                        }
                    .padding()
                    }
                    .padding()
                    
                }
            }
            
        }
        
    }
    
}


#Preview {
    myFam()
}
