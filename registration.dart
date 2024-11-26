import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(backgroundColor: Colors.black,
        title: const Center(child:Text('InstagRUN Регистрация',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 20,),),
      ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.tightFor(width: 300, height: 600),
          child: Form(
            key: _formKey,
            child: Column(
              children: [             
                Container(
                  color: Color.fromARGB(255, 168, 170, 255),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(1),
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
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
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 168, 170, 255),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(1),
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Пароль', border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите пароль';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 168, 170, 255),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(1),
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Пароль ещё раз', border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, введите пароль';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Зарегистрироваться'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Здесь можно добавить логику регистрации
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Регистрация успешна!')),
                      );
                      // Можно перенаправить на другой экран, например на экран входа
                    }
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Назад'),
                  onPressed: () {
                    Navigator.pop(context); // Возврат на предыдущий экран
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}