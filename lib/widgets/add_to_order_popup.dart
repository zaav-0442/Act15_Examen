import 'package:flutter/material.dart';

void showOrderSheet(BuildContext context, String imageUrl, String productName) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.80,
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(width: 50, height: 5, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 20),
                    Text(productName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text("Producto seleccionado con ingredientes frescos de la mejor calidad.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/orderStatus');
                        },
                        child: const Text("IR AL PEDIDO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}