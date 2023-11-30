// HOME / LANDING PAGE

import SwiftUI

struct AllMembersView: View {
    @Binding var tasks: Array<Task>
    
    var body: some View {
        NavigationStack {
            ZStack {
                // PURPLE THEME HEADER
                Color.backgroundPurple
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("FamCare Groups")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            // CREATING HARD CODED GROUPS FOR CARE-GROUPS
                            GroupBox {
                                NavigationLink(destination: ContentViewDocsView(tasks: $tasks)) {
                                VStack {
                                    Text("Nana's Club")
                                        .foregroundStyle(.black)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    Text("4 Members")
                                        .foregroundStyle(.black)
                                    HStack {
                                            Image("cool_gran")
                                                .resizable()
                                                .frame(width: 120, height: 100)
                                                .scaledToFit()
                                                .clipShape(Circle())
                                            
                                            
                                            VStack {
                                                HStack {
                                                    VStack{
                                                        Image("MumPic")
                                                    }
                                                    Image("DadPic")
                                                    Image("BrotherPic")
                                                }
                                                HStack {
                                                    Image("SisterPic")
                                                    Image("GreyPlusButton")
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.lightGrey)
                                }
                                //box frame
                                .frame(width: 330, height: 190)
                                .cornerRadius(25)
                            }
                            Button {
                                print("Poop :( ")
                            } label: {
                                Image("PoppyPopClub")
                            }
                            Button {
                                print("Poop :( ")
                            } label: {
                                Image("BlankClub")
                            }
                        }
                    }
                }
                .padding(.top, 40)
            }
        }
        .navigationBarHidden(true)
        .accentColor(.white)
    }
}
