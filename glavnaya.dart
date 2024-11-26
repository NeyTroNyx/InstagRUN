import 'package:flutter/material.dart';
import 'comment.dart';
import 'dart:math';



class Glavnaya extends StatelessWidget {
  final String email;
   Glavnaya({required this.email});
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    NewsFeedPage(),
    FriendsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: const Text(
            'InstagRUN',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 30,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // Значок плюс
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WorkoutForm()),
            );
          }       
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Друзья',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NewsFeedPage extends StatelessWidget {
  final List<News> newsList = [
    News(
      authorName: "Александр",
      authorAvatar: "assets/avatar1.png",
      description: "Александр пробежал 5 км.",
      km: 5,
      steps: 7000,
      calories: 350,
    ),
    News(
      authorName: "Мария",
      authorAvatar: "assets/avatar2.png",
      description: "Мария завершила 10 км в парке.",
      km: 10,
      steps: 14000,
      calories: 700,
    ),
    News(
      authorName: "Дмитрий",
      authorAvatar: "assets/avatar3.png",
      description: "Дмитрий пробежал 7 км в гору.",
      km: 7,
      steps: 10000,
      calories: 500,
    ),
    News(
      authorName: "Анастасия",
      authorAvatar: "assets/avatar4.png",
      description: "Анастасия пробежала 3 км, слушая музыку.",
      km: 3,
      steps: 4000,
      calories: 200,
    ),
    News(
      authorName: "Сергей",
      authorAvatar: "assets/avatar5.png",
      description: "Сергей прошел 8 км в поддержку здоровья.",
      km: 8,
      steps: 11000,
      calories: 600,
    ),
    News(
      authorName: "Ольга",
      authorAvatar: "assets/avatar6.png",
      description: "Ольга пробежала 6 км, наслаждаясь природой.",
      km: 6,
      steps: 8500,
      calories: 400,
    ),
    News(
      authorName: "Игорь",
      authorAvatar: "assets/avatar7.png",
      description: "Игорь пробежал 12 км на утренней пробежке.",
      km: 12,
      steps: 16000,
      calories: 800,
    ),
    News(
      authorName: "Екатерина",
      authorAvatar: "assets/avatar8.png",
      description: "Екатерина завершила 4 км, чтобы расслабиться.",
      km: 4,
      steps: 5000,
      calories: 250,
    ),
    News(
      authorName: "Виктор",
      authorAvatar: "assets/avatar9.png",
      description: "Виктор пробежал 9 км с друзьями.",
      km: 9,
      steps: 12000,
      calories: 650,
    ),
    News(
      authorName: "Наталья",
      authorAvatar: "assets/avatar10.png",
      description: "Наталья пробежала 11 км по пляжу.",
      km: 11,
      steps: 15000,
      calories: 750,
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(newsList[index].authorAvatar),
            ),
            title: Text(newsList[index].authorName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsList[index].description),
                Text("Километры: ${newsList[index].km}"),
                Text("Шаги: ${newsList[index].steps}"),
                Text("Сожженные калории: ${newsList[index].calories}"),
                
              ],
            ),
          ),
        );
      },
    );
  }
}

class News {
  final String authorName;
  final String authorAvatar;
  final String description;
  final int km;
  final int steps;
  final int calories;

  News({
    required this.authorName,
    required this.authorAvatar,
    required this.description,
    required this.km,
    required this.steps,
    required this.calories,
  });
}

class FriendsPage extends StatelessWidget {
  final List<String> friends = [
    'Дмитрий',
    'Александр',
    'Марина',
    'Светлана',
    'Евгений',
    'Ольга',
    'Ирина',
    'Анна',
    'Сергей',
    'Наталия',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 168, 170, 255),
        title: const Text('Друзья',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), 
              fontSize: 30,),),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(friends[index]),
            onTap: () => _showFriendDialog(context, friends[index]),
          );
        },
      ),
    );
  }

  void _showFriendDialog(BuildContext context, String friendName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(friendName),
          content: Text('Информация о друге: $friendName'),
          actions: <Widget>[
            TextButton(
              child: const Text('Чат'),
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалог перед переходом
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen(friendName: friendName)),
                );
              },
            ),
            TextButton(
              child: const Text('Закрыть'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

class ChatScreen extends StatefulWidget {
  final String friendName;

  ChatScreen({required this.friendName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();
  
  // Список предустановленных ответов от друга
  final List<String> friendResponses = [
    "Привет",
"Всё пучком",
"Отлично!",
"Отлично! Сам как?",
"Как тебе флаттер?",
"Добрый день",
"Какую музыку ты слушаешь сейчас?",
"Как тебе погода?",
"Супер! а у тебя?",
"Супер",
"Давай встретимся и пообщаемся!",
"Мне кажется, нам стоит попробовать что-то новое.",
"Не желаешь побегать?",
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(Message(text: _controller.text, isMe: true));
        _controller.clear(); // Очистить поле ввода после отправки
      });

      // Генерация случайного ответа от друга
      Random random = Random();
      int randomIndex = random.nextInt(friendResponses.length);
      String randomResponse = friendResponses[randomIndex];

      // Здесь можно добавить задержку для более естественного ответа
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          messages.add(Message(text: randomResponse, isMe: false));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 168, 170, 255),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(widget.friendName,style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),),),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message.isMe ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Ваше сообщение',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String aboutMe = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(Icons.person, size: 100), // Иконка человека
                SizedBox(width: 16),
                Text(
                  'Мой Профиль',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Column(children: [
              Container(
                color: Color.fromARGB(255, 168, 170, 255),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Имя',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ваше имя';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
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
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ваш email';
                    }
                    // Простая валидация электронной почты
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Пожалуйста, введите корректный email';
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
              // Если у вас есть поле "О себе", вы можете добавить его здесь
              Container(
                color: Color.fromARGB(255, 168, 170, 255),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'О себе',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      aboutMe = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Проверка валидности формы перед отправкой данных
                  if (_formKey.currentState!.validate()) {
                    // Здесь можно обработать данные (например, отправить их на сервер)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Данные успешно отправлены!')),
                    );
                  }
                },
                child: Text('Сохранить'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}