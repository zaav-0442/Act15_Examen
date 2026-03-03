import 'package:flutter/material.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(child: Text("MI PEDIDO", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 102, 102, 102)))),
            ),
            
            // Línea de tiempo
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  children: [
                    _buildStep(icon: Icons.list_alt, title: "Realiza tu lista", subtitle: "Productos seleccionados", isFirst: true, isCompleted: true),
                    _buildStep(icon: Icons.payment, title: "Haz tu pedido", subtitle: "Pago confirmado", isCompleted: true),
                    _buildStep(icon: Icons.soup_kitchen, title: "En preparación", subtitle: "Cocinando tu pizza...", isCompleted: false),
                    _buildStep(icon: Icons.delivery_dining, title: "En camino", subtitle: "Repartidor cerca", isLast: true, isCompleted: false),
                  ],
                ),
              ),
            ),

            // Mapa desde GitHub (Pantalla 2)
            Container(
              margin: const EdgeInsets.all(20),
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://raw.githubusercontent.com/zaav-0442/Act15_Examen/main/pantalla2/mapa.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
            child: Row(
              children: [
                const Icon(Icons.fastfood, size: 30, color: Colors.orange),
                const SizedBox(width: 8),
                const Text("Freddy's", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange)),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildStep({required IconData icon, required String title, required String subtitle, bool isFirst = false, bool isLast = false, bool isCompleted = false}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(width: 2, height: 20, color: isFirst ? Colors.transparent : Colors.orange),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: isCompleted ? Colors.orange : Colors.grey[300], shape: BoxShape.circle),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              Expanded(child: Container(width: 2, color: isLast ? Colors.transparent : Colors.orange)),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }
}