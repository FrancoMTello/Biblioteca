

import './data/Adaptadores/adaptador_memoria.dart';
import 'entidades/libro.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repositorio = AdaptadorBibliotecaMemoria();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(repositorio: repositorio),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AdaptadorBibliotecaMemoria repositorio;

  HomeScreen({required this.repositorio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => mostrarTodosLosLibros(context, repositorio),
              child: Text('Mostrar todos los libros'),
            ),
            ElevatedButton(
              onPressed: () => agregarLibro(context, repositorio),
              child: Text('Agregar un libro'),
            ),
            ElevatedButton(
              onPressed: () => mostrarTodosLosUsuarios(context, repositorio),
              child: Text('Mostrar todos los usuarios'),
            ),
            ElevatedButton(
              onPressed: () => agregarUsuario(context, repositorio),
              child: Text('Agregar un usuario'),
            ),
            ElevatedButton(
              onPressed: () => mostrarLibrosNoDevueltos(context, repositorio),
              child: Text('Mostrar libros no devueltos'),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarTodosLosLibros(BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final libros = repositorio.todosLosLibros();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Todos los libros'),
        content: libros.isEmpty
            ? Text('No hay libros registrados.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: libros.map((libro) => Text('ID: ${libro.id}, Nombre: ${libro.nombre}')).toList(),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void agregarLibro(BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final idController = TextEditingController();
    final nombreController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar un libro'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID del libro'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nombreController,
              decoration:const InputDecoration(labelText: 'Nombre del libro'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final id = int.parse(idController.text);
              final nombre = nombreController.text;
              final libro = Libro(id, nombre);
              repositorio.agregarLibro(libro);
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void mostrarTodosLosUsuarios(BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final usuarios = repositorio.todosLosUsuarios();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:const Text('Todos los usuarios'),
        content: usuarios.isEmpty
            ? const Text('No hay usuarios registrados.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: usuarios.map((usuario) => Text('DNI: ${usuario.dni}, Nombre: ${usuario.nombre} ${usuario.apellido}')).toList(),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void agregarUsuario(BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final dniController = TextEditingController();
    final nombreController = TextEditingController();
    final apellidoController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar un usuario'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: dniController,
              decoration:const InputDecoration(labelText: 'DNI del usuario'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: nombreController,
              decoration:const InputDecoration(labelText: 'Nombre del usuario'),
            ),
            TextField(
              controller: apellidoController,
              decoration: const InputDecoration(labelText: 'Apellido del usuario'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final dni = int.parse(dniController.text);
              final nombre = nombreController.text;
              final apellido = apellidoController.text;
              final usuario = Usuario(
                dni: dni,
                nombre: nombre,
                apellido: apellido,
                telefono: 0,
                email: '',
              );
              repositorio.agregarUsuario(usuario);
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void mostrarLibrosNoDevueltos(BuildContext context, AdaptadorBibliotecaMemoria repositorio) {
    final librosNoDevueltos = repositorio.todosLosLibrosNoDevueltos();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Libros no devueltos'),
        content: librosNoDevueltos.isEmpty
            ? const Text('No hay libros sin devolver.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: librosNoDevueltos.map((libro) => Text('ID: ${libro.id}, Nombre: ${libro.nombre}')).toList(),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}