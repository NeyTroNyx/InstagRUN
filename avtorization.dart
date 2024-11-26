import 'package:flutter/material.dart';
import 'package:kursovaya/glavnaya.dart';
import 'registration.dart';

class LoginPage extends StatelessWidget {
  final String registeredEmail;
  final String registeredPassword;

  LoginPage({required this.registeredEmail, required this.registeredPassword});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(backgroundColor: Colors.black,
        title: const Center(child:Text('InstagRUN Авторизация',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 20,),),
      ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.tightFor(width: 300, height: 600),         
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 168, 170, 255),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите вашу электронную почту';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Введите корректный email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                       {
                        emailController.text = value;
                      };
                    },
                    decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  ),
                ),
          Container(
                  color: Color.fromARGB(255, 168, 170, 255),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Пароль', border: OutlineInputBorder()),
            obscureText: true,
          ),
          ),
          Text(''),
          ElevatedButton(
  onPressed: () {
    // Проверка введенных данных
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      // Ошибка входа
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Неверный email или пароль')),
      );
    } else {
      String email = emailController.text;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Glavnaya(email: email), // Передача email в Glavnaya
      ));
    }
  },
  child: Text('Войти'),
),
          Text(''),
          ElevatedButton(
             child: const Text('Регистрация'),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrationPage()),
            );
          }       
        ),
        ],
      ),
    ),
    ),
    );

  }
}


