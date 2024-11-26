import 'package:flutter/material.dart';


class WorkoutForm extends StatefulWidget {
  @override
  WorkoutFormState createState() => WorkoutFormState();
}

class WorkoutFormState extends State<WorkoutForm> {
  final TextEditingController kilometersController = TextEditingController();
  final TextEditingController stepsController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  String? selectedAction;

  final List<String> actions = [
    'завершил',
    'пробежал',
    'прошел',
    'закончил тренировку'
  ];

  void navigateToTable() {
    String kilometers = kilometersController.text;
    String steps = stepsController.text;
    String calories = caloriesController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutTable(
          action: selectedAction ?? 'Нет действия',
          kilometers: kilometers,
          steps: steps,
          calories: calories,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text('Тренировка',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: kilometersController,
              decoration: InputDecoration(
                labelText: 'Километры',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: stepsController,
              decoration: InputDecoration(
                labelText: 'Шаги',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: caloriesController,
              decoration: InputDecoration(
                labelText: 'Сожженные калории',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Действие',
                border: OutlineInputBorder(),
              ),
              items: actions.map((String action) {
                return DropdownMenuItem<String>(
                  value: action,
                  child: Text(action),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAction = newValue;
                });
              },
              value: selectedAction,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: navigateToTable,
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutTable extends StatelessWidget {
  final String action;
  final String kilometers;
  final String steps;
  final String calories;

  WorkoutTable({
    required this.action,
    required this.kilometers,
    required this.steps,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Данные тренировки',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Влад $action',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Километры:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(kilometers),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Шаги:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(steps),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Сожженные калории:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(calories),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // изменения положения тени
                  ),
                ],
              ),
              child: Text(
                'Ты сильнее, чем думаешь! Продолжай трудиться и достигай своих целей!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 168, 170, 255)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}