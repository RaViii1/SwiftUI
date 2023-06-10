import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    let author: String
    let title: String
    var availableCopies: Int
}

struct AuthorSearchView: View {
    
    @State private var searchTerm = ""
    
    let books = [
        Book(author: "J.K. Rowling", title: "Harry Potter and the Philosopher's Stone", availableCopies: 3),
        Book(author: "J.K. Rowling", title: "Harry Potter and the Chamber of Secrets", availableCopies: 1),
        Book(author:"George Orwell", title:"1984",availableCopies :5)
        
        //dodaj pozostałe książki tutaj
        
    ]
    
    var body : some View{
        
        NavigationView{
            VStack{
                HStack{
                    TextField("Wyszukaj autora...", text:$searchTerm)
                        .padding(.horizontal,20)
                    
                    Button(action:{
                        self.searchTerm=""
                    }){
                        Image(systemName:"xmark.circle.fill")
                            .opacity(searchTerm=="" ?0 :1 )
                        
                    }
                }.padding(.horizontal,10).padding(.top,5)
                
                List(books.filter({book in book.author.contains(searchTerm) || searchTerm.isEmpty})) { book in
                    
                    NavigationLink(destination:
                                    BookDetailView(bookDetailAuthor:
                                                        book.author,
                                                    books:self.books)){
                                                        
                                                        VStack(alignment:.leading){
                                                            Text(book.title)
                                                                .font(.headline)
                                                            
                                                            Text("\(book.availableCopies) egzemplarzy dostępnych")
                                                                .foregroundColor(Color.gray)

                                                        }

                                                
                                            
                                        }
                                        
                                    
                                }}
                                
                            
                            .navigationBarTitle(Text("Książki"))
                            }
                            
                        }}
                        
                    
struct BookDetailView:View{
    
    let bookDetailAuthor:String
    var books:[Book]
    
    var body:some View{
        
        VStack(alignment:.leading){
            
            Text("\(bookDetailAuthor)")
                .font(.headline)
            List(books.filter({$0.author==bookDetailAuthor})){ book in
                
                HStack{
                    Text(book.title)
                    
                    Spacer()
                    
                    Text("\(book.availableCopies) egzemplarzy dostępnych")
                        .foregroundColor(Color.gray)

                
                }
                
                
                
            }
            
            
        }.padding(.horizontal,10).padding(.top,5)
        


        
        
        
        
        
    }
    
    
    
    
}
