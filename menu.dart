import 'package:flutter/material.dart';
import 'avtorization.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(backgroundColor: Colors.black,
        title: Center(
          child: const Text('InstagRUN',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), 
              fontSize: 30,),),
        )
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Выполнить вход'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(registeredEmail: AutofillHints.email, registeredPassword: AutofillHints.password)),
            );
          },
        ),
      ),
    );
  }
}