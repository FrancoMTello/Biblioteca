import '../../Repositorios/repositorio_de_biblioteca.dart';
import '../../entidades/libro.dart';


class AdaptadorBibliotecaFirebase implements RepositorioBiblioteca {
  // Aquí implementarías las llamadas a Firebase
  @override
  void agregarLibro(Libro nuevoLibro) {
    // Implementación específica para Firebase
  }

  @override
  void agregarUsuario(Usuario nuevoUsuario) {
    // Implementación específica para Firebase
  }

  @override
  List<Libro> todosLosLibros() {
    // Implementación específica para Firebase
    return [];
  }

  @override
  List<Usuario> todosLosUsuarios() {
    // Implementación específica para Firebase
    return [];
  }

  @override
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento) {
    // Implementación específica para Firebase
  }

  @override
  List<Libro> todosLosLibrosNoDevueltos() {
    // Implementación específica para Firebase
    return [];
  }
}
