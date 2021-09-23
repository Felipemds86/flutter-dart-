import 'package: flutter / material.dart';

void main () {
  runApp (MaterialApp (
    casa: casa (),
    debugShowCheckedModeBanner: false,
  ));
}

// Criar o ambiente e os componentes (Widget) da aplicação
// Um ​​Flutter utiliza dois tipos de comportamento para objetos:
// 1. Stateful - responde à mudanças e mudanças
// 2. Apátrida - sem comportamento

// Criar uma classe que leva o nome da aplicação (nome de execução)
class Home extends StatefulWidget {
  @sobrepor
  _HomeState createState () => _HomeState ();
}

// Dentro desta classe ocorrem como operações da aplicação
class _HomeState extends State <Home> {
  // Vamos implementar nossos Widgets (componentes)
  TextEditingController alcoolController = TextEditingController ();
  TextEditingController gasolinaController = TextEditingController ();

  // Variável para controlar o formulário
  GlobalKey <FormState> _formKey = GlobalKey <FormState> ();

  // Variável que receberá o resultado do cálculo em modo texto
  String _resultado = '';
  
//vamnos criar os metodos de:reset e calcular 
  void _calcularCombustivel() {
    // Muda o estado das variáveis
    setState(() {
      double va = double.parse(alcoolController.text.replaceAll(',', '.'));
      double vg = double.parse(gasolinaController.text.replaceAll(',', '.'));
      double proporcao = (va / vg);

      _resultado =
          (proporcao < 0.7 ? 'Abasteça com Álcool' : 'Abasteça com Gasolina');
    });
  }

  // Método que constrói uma interface gráfica da aplicação
  @sobrepor
  Construção de widget (contexto BuildContext) {
    return Scaffold (
      appBar: AppBar (
        título: const Text (
          'Álcool ou Gasolina',
          style: TextStyle (color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue [900],
        ações: <Widget> [
          IconButton (onPressed: () {}, ícone: Icon (Icons.refresh))
        ],
      ),
      // Vamos criar o corpo do App
      body: SingleChildScrollView (
        preenchimento: EdgeInsets.fromLTRB (10.0, 0, 10.0, 0),
        filho: Formulário (
          chave: _formKey,
          filho: coluna (
            // reserva um espaço para armazenar os campos
            crossAxisAlignment: CrossAxisAlignment.stretch,
            filhos: <Widget> [
              // vamos colocar um ícone e bomba de gasolina
              Ícone(
                Icons.local_gas_station,
                tamanho: 50,0,
                color: Colors.lightBlue [900],
              ),
              // Construir os campos do formulário
              TextFormField (
                controlador: alcoolController,
                textAlign: TextAlign.center,
                // Vamos incrementar o "treco" com uma animação
                decoração: InputDecoration (
                    labelText: 'Valor do Álcool',
                    labelStyle: TextStyle (
                        color: Colors.lightBlue [900], fontSize: 26.0)),
              ),
              TextFormField (
                controlador: gasolinaController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                // Vamos incrementar o "treco" com uma animação
                decoração: InputDecoration (
                    labelText: 'Valor da Gasolina',
                    labelStyle: TextStyle (
                        color: Colors.lightBlue [900], fontSize: 26.0)),
              ),
              // vamos criar o botão para calcular
              Preenchimento(
                preenchimento: EdgeInsets.only (superior: 50, inferior: 50),
                criança: Container (
                  altura: 50,
                  filho: RawMaterialButton (
                    onPressionado: () {},
                    filho: Texto (
                      'VERIFICAR',
                      style: TextStyle (color: Colors.white, fontSize: 35),
                    ),
                    fillColor: Colors.lightBlue [900],
                  ),
                ),
              ),
              // vamos mostrar o resultado do cálculo
              Texto(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle (color: Colors.lightBlue [900], fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}