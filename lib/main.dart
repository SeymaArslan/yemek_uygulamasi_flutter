import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/DetaySayfa.dart';
import 'package:yemek_uygulamasi/Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // veri kümemiz
  Future<List<Yemekler>> yemekleriGetir() async{
    var yemekListesi = <Yemekler>[];  // liste oluşturduk, Yemekler sınıfından nesneleri içerisinde tutuyor

    var y1 = Yemekler(1, "Köfte", "kofte.png", 15.99);  // nesnelerimiz
    var y2 = Yemekler(2, "Ayran", "ayran.png", 2.0);
    var y3 = Yemekler(3, "Fanta", "fanta.png", 3.0);
    var y4 = Yemekler(4, "Makarna", "makarna.png", 14.99);
    var y5 = Yemekler(5, "Kadayıf", "kadayif.png", 8.5);
    var y6 = Yemekler(6, "Baklava", "baklava.png", 15.99);

    yemekListesi.add(y1); // liste içerisine nesneleri aktardık
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;  // arayüzde göstermek için hazır ve return ettik

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(), // future içerisine çalıştıracağımız metodun adını yazıyoruz
        builder: (context, snapshot){ // snapshot ile yukarıdaki metod bize veri getirdi mi getirmedi mi bilgiler ne öğreniyoruz
          if(snapshot.hasData){
            var VeriYemek = snapshot.data; // data ile yukarıdaki metodun sonucunu almış oluyoruz, yemekListesi(gelenYemek yaptım) değişken adını aynı kullandık farklı da olabilirdi

            return ListView.builder(
              itemCount: VeriYemek!.length,
              itemBuilder: (context,indeks){
                var gelenYemek = VeriYemek[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yemek: gelenYemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 150, height: 150, child: Image.asset("fotolar/${gelenYemek.yemek_resim_adi}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(gelenYemek.yemek_adi, style: TextStyle(fontSize: 25),),
                            SizedBox(height: 50),
                            Text("${gelenYemek.yemek_fiyat} \u{20BA}", style: TextStyle(fontSize: 20, color: Colors.blueAccent),),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );
          } else{
            return Center();
          }
        },
      ),
    );
  }
}
