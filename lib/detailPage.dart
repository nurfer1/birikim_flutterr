import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final double progress;

  DetailPage({required this.title, required this.progress});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double addedAmount = 0.0;
  double totalAmount = 150.0;
  double productPrice = 150.0;

  void addAmount(double amount) {
    setState(() {
      addedAmount = amount;
      totalAmount -= addedAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = totalAmount / productPrice; // Yüzde hesaplaması

    return Scaffold(
      appBar: AppBar(
        title: Text('Para Biriktirme Uygulaması'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.lightBlue[100], // Sayfa arkaplan rengi
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: widget.progress, // Parametre olarak gelen progress değerini kullanıyoruz
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                backgroundColor: Colors.grey[300],
                strokeWidth: 10,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Kalan Para',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              '${totalAmount.toStringAsFixed(2)} TL',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ürünün Fiyatı',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              '${productPrice.toStringAsFixed(2)} TL',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 32),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  addedAmount = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Para Miktarını Girin',
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => addAmount(addedAmount),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(
                'Para Ekle',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
