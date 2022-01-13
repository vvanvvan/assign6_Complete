import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'guess_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController(); //or TextEditingController _controller = TextEditingController().  var _controller = TextEditingController();
  var gameCount = Game(maxRandom: 100+1);
  String texterror = 'RESULT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent, //lightBlue.shade50 ความโปร่งแสง????
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/guess_logo.png', width: 90.0),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('GUESS',
                            style:
                            TextStyle(fontSize: 36.0, color: Colors.white)),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.purple.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(),
                      hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
                    ),
                  )

              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: () {
                    var input = _controller.text;

                    /*var new55555 = int.parse(input);
                    if(new55555 >= 0 || new55555 <= 100 ){
                      texterror = 'RESULT';
                      ////print(texterror);
                    }*/
                    var text = playGame(input,gameCount);
<<<<<<< HEAD
                    var text2 = int.tryParse(input);
                    if(text2 == null){
                      texterror = 'ERROR';
                    }
                    ////var g = new Game();
                    ////var error = Game().doGuess(num);
=======
                    ////var g = new Game();
                    ////var error = Game().doGuess(num);

>>>>>>> origin/master

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(texterror),
                          content: Text(text),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
