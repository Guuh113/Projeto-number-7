import 'package:flutter/material.dart';
import 'package:tutorial07/model/filme_model.dart';
import 'package:tutorial07/database.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Filme> filmes = Database.getFilmes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text(
            "CineFlutter",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 2,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index];

            final Color starColor = filme.imdb > 8.5
                ? Colors.amber
                : Colors.grey;

            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),

                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent.withOpacity(0.1),
                  child: const Icon(Icons.movie, color: Colors.blueAccent),
                ),

                title: Text(
                  filme.titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                // Subtítulo estilizado
                subtitle: Text(
                  'Ano: ${filme.anoLancamento}',
                  style: TextStyle(color: Colors.grey[700]),
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: starColor, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      filme.imdb.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                onTap: () {
                  print('Clicou em: ${filme.titulo}');
                },

                onLongPress: () {
                  print('Você clicou LongPress no filme ${filme.titulo}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
