import 'package:flutter/material.dart';

// import 'ejercicio8_view.darimport 'ejercicio5_view.dart';
import 'ejercicio5_view.dart';
import 'ejercicio6_view.dart';
import 'ejercicio8_view.dart';
import 'ejercicio9_view.dart';
import 'ejercicio10_view.dart';
// import 'ejercicio10_view.dart';

/// Átomos
class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MenuButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 55), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        onPressed: onPressed,
        child: Text(
          text, 
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/// Página Principal Home)
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú de Tareas'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Seleccione un ejercicio:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              
              MenuButton(
                text: 'Ejercicio 5: Conversión de Medidas',
                onPressed: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ejercicio5Pagina()));
                },
              ),
              
              MenuButton(
                text: 'Ejercicio 6: Capacidad Disco Duro',
                onPressed: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ejercicio6Pagina()));
                },
              ),
              
              MenuButton(
                text: 'Ejercicio 8: Compañía de Seguros',
                onPressed: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ejercicio8Pagina()));
                },
              ),
              
              MenuButton(
                text: 'Ejercicio 9: Incentivos de Operario',
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => Ejercicio9Pagina())
                  );
                },
              ),
              
              MenuButton(
                text: 'Ejercicio 10: Descuento Supermercado',
                onPressed: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ejercicio10Pagina()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}