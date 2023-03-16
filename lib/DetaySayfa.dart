import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/Yemekler.dart';

class DetaySayfa extends StatefulWidget {

  Yemekler yemek;

  DetaySayfa({required this.yemek});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.yemek_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("fotolar/${widget.yemek.yemek_resim_adi}"),
            Text("${widget.yemek.yemek_fiyat} \u{20BA}", style: TextStyle(fontSize: 40, color: Colors.blueAccent),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: (){
                    print("${widget.yemek.yemek_adi} sipariş verildi");
                  },
                  child: Text("Sipariş Ver", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
