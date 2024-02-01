import 'package:flutter/material.dart';

void main() => runApp(MiApp()); // llama al primer widget que se ejecutará

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // es el estilo de la app
      title: "Primera App", // nombre de la app
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController controlador1 = TextEditingController();
  TextEditingController controlador2 = TextEditingController();

  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // estructura básica de una app
      // estructura de una app movil
      appBar: AppBar(
        title: Text("Suma"),
      ),
      body: Center(
        child: Principal(),
      ),
    );
  }

  Widget Principal() {
    return Column(
      children: [
        Row(children: [Text("Introducir dato "), cajaTexto(controlador1)]),
        espacio(10.6),
        Row(children: [Text("Introducir dato "), cajaTexto(controlador2)]),
        espacio(10.6),
        Text(
          "$resultado",
          style: TextStyle(
            fontSize: 20.0, // Ajusta este valor según tus necesidades
          ),
        ),
        espacio(10.6),
        boton()
      ],
    );
  }

  Widget boton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          var calculo =
              int.parse(controlador1.text) + int.parse(controlador2.text);
          resultado = calculo.toString();
        });
      },
      style: ButtonStyle(
          maximumSize: MaterialStateProperty.all(const Size(200.0, 100.0))),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Icon(
              Icons.add,
              size: 10,
            ),
            Text("Sumar")
          ])),
    );
  }

  Widget cajaTexto(TextEditingController controlador) {
    return Container(
        width: 200.0,
        child: TextField(
          controller: controlador,
          autofocus: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.send,
          // icono del botón
          autocorrect: true,
          textAlign: TextAlign.end,
          maxLength: 20,
          obscureText: false,
          // passowrd
          style: TextStyle(color: Colors.red),
          decoration: InputDecoration(
            hintText: "Introducir",
            hintStyle: TextStyle(color: Colors.green),
            helperText: "Introducir datos",
          ),
        ));
  }

  Widget espacio(double tamano) {
    return Container(
      height: tamano,
    );
  }
}
