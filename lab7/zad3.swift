import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    let author: String
    let title: String
    var availableCopies: Int
}

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Wpisz autora", text: $searchText)
                    .padding(.horizontal)
                
                NavigationLink(destination:
                    BookListView(searchAuthor: searchText)) {
                        Text("Szukaj")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
            }.navigationTitle("Wyszukiwanie książek")
        }
    }
}

struct BookListView : View {
    
    let books = [
        Book(author:"Adam Mickiewicz", title:"Pan Tadeusz", availableCopies: 5),
        Book(author:"Henryk Sienkiewicz", title:"Quo Vadis", availableCopies: 3),
        Book(author:"Juliusz Słowacki", title:"Balladyna", availableCopies :2),
        Book(author:"Eliza Orzeszkowa ",title :"Nad Niemnem" ,availableCopies :1 ),
        
     ]
     
     let searchAuthor:String
    
     func filterBooks(_ bookList:[Book], _ authorName:String) -> [Book]{
         return bookList.filter {$0.author == authorName}
     }

       var body:some View{
           List(filterBooks(books,searchAuthor)){book in
               HStack(spacing :20){
                   Text(book.title).bold()
                   Spacer()

                   Text("Dostępne egzemplarze: \(book.availableCopies)")
               }
           }.navigationTitle("\(searchAuthor) - książki")
       }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BookListView_Previews : PreviewProvider{
    static var previews:some View{
        BookListView(searchAuthor:"Adam Mickiewicz")
    }
}
