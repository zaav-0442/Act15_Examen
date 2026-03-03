import 'package:flutter/material.dart';
import '../widgets/add_to_order_popup.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  // Agregamos un parámetro de consulta para saltar la caché de GitHub
  final String baseUrl = "https://raw.githubusercontent.com/zaav-0442/Act15_Examen/main/pantalla1/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomAppBar(context),
            _buildSectionTitle(),
            _buildBanner(),
            
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  // Agregamos ?v=1 para forzar la actualización de la imagen
                  String imgUrl = "${baseUrl}cat${index + 1}.jpg?v=1";
                  return ProductItem(
                    imageUrl: imgUrl, 
                    name: "Pizza Especial ${index + 1}"
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widgets de apoyo para limpiar el código ---

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

  Widget _buildSectionTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text("CATEGORÍA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF616161))),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        "${baseUrl}banner.jpg",
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[300], child: const Icon(Icons.image)),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const ProductItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Usamos un LoadingBuilder para saber si la imagen está cargando
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null));
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
                Positioned(top: 8, right: 8, child: Icon(Icons.favorite_border, color: const Color.fromARGB(255, 255, 255, 255))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () => showOrderSheet(context, imageUrl, name),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text("Añadir", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}