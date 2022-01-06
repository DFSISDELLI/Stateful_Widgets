
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() => runApp (MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MediaForm(),
    );
  }
}
class MediaForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MediaFormState();

}

class MediaFormState extends State<MediaForm> {


  // Controlador da caixa de texto (TextField):
  TextEditingController Nome = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Notaum = TextEditingController();
  TextEditingController Notadois = TextEditingController();
  TextEditingController Notatres = TextEditingController();

  // String que vai armazenar o conteúdo da caixa de texto:
  String texto = "";
  String nome = "";
  String email = "";
  String nota1 = "";
  String nota2 = "";
  String nota3 = "";
  String media = "";

  @override
  Widget build(BuildContext formContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefa Final DPM 2021.2"),
      ),


      //corpo maior
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //coluna principal
        child: Column(
          //filhos
          children: <Widget>[



            //abre - primeiro padding - caixa de texto
             const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "CALCULADOR DE MÉDIA",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //fecha - primeiro padding - caixa de texto


            //abre - segundo padding - Caixa Nome
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 5.0,
              ),
              child: SizedBox(
                height: 50.0,
                child: TextField(
                  controller: Nome,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      hintText: "Digite o nome do aluno: ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
              ),
            ),
            //fecha - segundo padding - Caixa Nome


            //abre - terceiro padding - Caixa e-mail
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 5.0,
              ),
              child: SizedBox(
                height: 50.0,
                child: TextField(
                  controller: Email,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: "Digite o e-mail do aluno: ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
              ),
            ),
         //fecha - terceiro padding - Caixa e-mail

            //abre - quarto padding - row de Notas

            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
              ),

              //abrindo filha a row
              child: Row(
                //abrindo a filha da filha row
                children: [

                  // abre caixa N1

                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextField(
                        controller: Notaum,
                        decoration: InputDecoration(
                          labelText: "Nota 1",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                          keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  //Fecha caixa N1

                  //caixa em branco - separador

                  Container(
                    width: 15.0,
                  ),

                  //abre caixa N2
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextField(
                        controller: Notadois,
                        decoration: InputDecoration(
                          labelText: "Nota 2",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  //Fecha caixa N2

                  //caixa em branco - separador

                  Container(
                    width: 15.0,
                  ),

                  //abre caixa N3
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextField(
                        controller: Notatres,
                        decoration: InputDecoration(
                          labelText: "Nota 3",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Fecha caixa N3

            //fecha a filha da filha row

            //fecha filha row

            //fecha - quarto padding - row de Notas


            //abre quinto padding - botao calcula media

            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
              ),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                child:  Text("CALCULA MÉDIA",
                ),
                onPressed: () {
                  setState(
                        () {
                      texto = calcula();
                    },
                  );
                },
              ),

            ),

            //fecha quinto padding - botao calcula


            //abre sexto padding - linha com texto resultado

             Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Resultado: " + texto,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ),
            //Fecha sexto padding - caixa de texto resultado

            //abre setimo padding - linha com texto Nome

            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Text("Nome: " + nome,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                    ),
                  ),
               ],
             ),
            ),

            //fecha setimo padding - linha com texto Nome

            //abre oitavo padding - linha com texto email

            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                children: <Widget>[
                   Text(
                    "e-mail: " + email,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
               ),
              ),

            //fecha oitavo padding - linha com texto email

            //abre nono padding - linha com as linhas das notas

            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),

              child: Row(
                children: <Widget>[
                   Text(
                    "Notas: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                    ),
                  ),
                  Text(
                    nota1 + "  -  ",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    nota2 + "  -  ",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    nota3,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            //fecha nono padding - linha com as linhas das notas

            //abre decima padding - linha com texto media

            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Text("Média: " + media,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                    ),
                  ),
                  Text(
                    media,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),

            //fecha decima padding - linha com texto media


            //abre 11º padding - botao apaga campos
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
              ),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40),
                ),

                child: Text(
                  'APAGA OS CAMPOS',
                ),
                onPressed: () {
                      nome = "";
                      email = "";
                      nota1 = "";
                      nota2 = "";
                      nota3 = "";
                      media = "";
                      Nome.text = "";
                      Email.text = "";
                      Notaum.text = "";
                      Notadois.text = "";
                      Notatres.text = "";
                      setState( () {
                        texto = ''; }
                 );
                },
              ),
            ),

            //fecha decima padding - linha com texto media

          ],
        ),
      ),

    );
  }


  // Função que faz os cálculos:

  String calcula() {
    // Aqui criamos variáveis pegando os valores digitados
    // nas caixas de texto (através dos controllers),
    // e convertemos para double.

    double notasum = double.parse(Notaum.text);
    double notasdois = double.parse(Notadois.text);
    double notastres = double.parse(Notatres.text);

    // a conta

    double total = ((notasum + notasdois + notastres) / 3);

    // Montando a string de saída, que vai ter o resultado do cálculo

    String saida = 'A MÉDIA É : ' +
        total.toStringAsFixed(1);
    return saida;
  }
}
