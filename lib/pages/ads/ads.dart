import 'package:flutter/material.dart';
import 'package:stateful_widget/classes/anuncio.dart';
import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/pages/ads/drawer-ad.dart';
import 'package:stateful_widget/pages/ads/form-new-ad.dart';

class Ads extends StatelessWidget {
  Ads({Key? key}): super(key: key);
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('FreelanceWorld'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print("se enfoca el input buscador");
              } ,
              color: Colors.grey,
            )
          ],

        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  <Widget>[
              NavAd(),
              Expanded(child: ListAds())
              
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: (){
        //     print("se agrego manin");
        //   },
        // ),
        drawer: Drawer(child: DrawerAnuncios(),)
      );
  }
}

class NavAd extends StatelessWidget {
  const NavAd({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return Card(
       color: Colors.blue[50],
                margin: EdgeInsets.all(20),
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                      Text(
                        "Mis anuncios",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(labelText: "Puesto, empresa o palabra clave"),
                          
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        child: Text("Buscar"),
                        onPressed: (){},
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        child: Text("Filtrar"),
                        onPressed: (){},

                        style: ElevatedButton.styleFrom(primary: Colors.blue[300]),
                      ),
                  
                     ]
                   ),
                 ),
    );
  }
}

class ListAds extends StatelessWidget {
  ListAds({Key? key}) : super(key: key);
  //  final List<Anuncio> anuncios = [
  //   Anuncio(title: "Web Dev", address: "Lima", type_timework: "Part-time", nro_postulantes: 5, createdDate: DateTime.now()),
  //   Anuncio(title: "Mobile Dev", address: "Trujillo", type_timework: "Full-time", nro_postulantes: 2, createdDate: DateTime.now())
  //   ];
  final List<Anuncio> anuncios = [];
  @override 
  Widget build(BuildContext context) {
    return anuncios.length > 0
    ? Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: anuncios.length,
          itemBuilder: (BuildContext context,index) {
            return AdRow(anuncio: anuncios[index]);
          },
        ),
      ),
    )
    : NoAd();
  }
}

class NoAd extends StatelessWidget {
  const NoAd({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No tiene anuncios",
            style: TextStyle(fontSize: 15, color: Colors.blue[800])),
            SizedBox(height: 15),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Crear nuevo anuncio",
                    style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: FontWeight.bold)),
                  // IconButton(
                  //   icon: Icon(Icons.add_circle),
                  //   onPressed: (){
                  //     print("click agregar anuncio");
                  //     _goToFormNewAd(context);
                  //   },
                  // ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: (){
                      print("se agrego manin");
                      print("click agregar anuncio");
                      _goToFormNewAd(context);
                    },
                  ),
                  
                ],
              ),
            )

          ]
        ),
      ),
    );
  }

  void _goToFormNewAd(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return FormNewAd();
    });
    Navigator.of(context).push(route);
  }
}
class AdRow extends StatelessWidget {
  
  final Anuncio anuncio;

  AdRow({Key? key, required this.anuncio}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              
              children: [
                Text(anuncio.address,
                style: TextStyle(fontSize: 10,color: Colors.grey),)
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(anuncio.title,
                style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                Text(anuncio.nro_postulantes.toString()+" Postulaciones",
                style: TextStyle(fontSize: 15, color: Colors.orange[700]))
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(anuncio.type_timework,
                style: TextStyle(fontSize: 10, color: Colors.grey)),
                Text(anuncio.createdDate.toString(),
                style: TextStyle(fontSize: 10, color: Colors.grey))
              ],
            ),
          ],
        ),
      )
    );
  }
}