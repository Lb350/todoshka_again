import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // По умолчанию - системная тема

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData.light(), // Светлая тема
      darkTheme: ThemeData.dark(), // Тёмная тема
      themeMode: _themeMode, // Текущая тема
      home: TodoListScreen(changeTheme: _changeTheme),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  final Function(ThemeMode) changeTheme;

  TodoListScreen({required this.changeTheme});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();
  TextEditingController editController = TextEditingController();
  int? selectedIndex;

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(int index) {
    editController.text = tasks[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Редактировать задачу"),
        content: TextField(controller: editController),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                tasks[index] = editController.text;
              });
              Navigator.pop(context);
            },
            child: Text("Сохранить"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: Icon(Icons.brightness_4),
            onSelected: widget.changeTheme,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeMode.light,
                child: Text("Светлая тема"),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Text("Тёмная тема"),
              ),
              PopupMenuItem(
                value: ThemeMode.system,
                child: Text("Как в системе"),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "Введите задачу...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Theme.of(context).primaryColor),
                        onPressed: () => editTask(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}