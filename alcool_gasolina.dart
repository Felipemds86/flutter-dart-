import 'package:flutter/material.dart';

Run|Debug|Porfile
void main(){
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
  ));// MaterialApp

}

//criar o ambiente e os componentes da aplicação
// a flutter utiliza dois tipos de comportamente para objetos:
//1. stateful - responde a alteracoes e variacoes 
//2. stateless- sem comportamento 

//criar uma classe que leva o nome da aplicacao (nome de execução)
class Home StatefulWidget{
  @override
  _HomeState createState()=> _HomeState();
}

class _HomeState extends State<Home> {
  //vamos implementar nossos widgets (componentes)
  TextEditingController alcoolControler = TextEditingController();
  TextEditingController gasolinaControler = TextEditingController();

  //variavel para controlar o formulario
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //variavel que revebera o resultado do calculo em modo de texto 
  String _resultado ='';

  //vamnos criar os metodos de:reset e calcular 
  void_calcularCombustivel(){
    //muda o estado das variaveis 
    setState((){
      double.parse(alcoolController.text.replaceAll(',', '.'));
      double vg = double.parse(gasolinaController.text.replaceAll(',', '.'));
      double proporcao = (va / vg);

      _resultado =
          (proporcao < 0.7 ? 'Abasteça com Álcool' : 'Abasteça com Gasolina');

    });
  }

  //metodo que constroi a inteface grafica da aplicação 
    @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alcool ou Gasolina',
          style: TextStyle(color: Colors.white),

          ),//Text
          centerTitle:true,
          backgroundcolor:colors.lightBlue[900],
          actions:<widget>[
            IconButton(onPressed:() {}, icon: Icon(icons.refresh))

          ],//<Widget>[]
        ), //AppBar
        //vamos criar o corpo do app
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0 , 10 , 0),
          child:Form(
            Key: _formKey,
            child: Column(
              //reserva um espcaço para armazenar os campos
              crossAxisAligment : crossAxisAligment.stretch,
              children:<widget>[
                //vamos colocar 
                Icon(
                  Icons.local_gas_station,
                  size:50.0,
                  color:colors.lightBlue[900],
                ),//Icon
                //construir os campos do formulario
                TextFormField(
                  controller: alcoolControler,
                  textAlign: textAlign.center,
                  KeyboardType: TextInputType.number,
                  //vamos incrementar o 'treco' com uma animacao 
                  decoration : InputDecoration(
                    labelText: 'Valor do Alcool',
                    labelStyle: TextStyle(
                      color: colors.lightBlue[900], fontsize: 26.0)),
                ),//textFormField
                //vamos criar um botao para calcular 
                Padding(
                  padding: EdgeInsets.only(top:50, bottom:50),
                  child: Container(
                    height: 50,
                    child: RawMaterialButton(
                      onpressed:() {},
                      child: Text(
                        'Verificar',
                        style: TextStyle(color: colors.white, fontsize: 35),
                        ),//text
                        fillcolor: colors.lightBlue[900] 
                    ),//rawmaterialbutton
                  ),// container
                ),//padding
                //vamos mostrar o resultado 
              ],//<widget>[]
            ),//column
         ),//Form
       ),//SingleChildScrollView
    );//Scaffold
  }
}