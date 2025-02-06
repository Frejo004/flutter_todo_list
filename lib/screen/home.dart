import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Roboto",
      ),

      home:Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 254, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 151, 202, 153),
          title: Center(child: Text("To Do List")),
        ),

        drawer: Drawer(),

        body: HomePage(),
      ) ,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _tasks = [
    {"title": "Dinner with Jenny", "completed": false},
    {"title": "Work on mobile apps for 2 hours", "completed": false},
    {"title": "Team Meeting", "completed": false},
    {"title": "Check Emails", "completed": false},
    {"title": "Buy Groceries", "completed": true},
    {"title": "Morning Exercise", "completed": true},
  ];

  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add({"title": _taskController.text, "completed": false});
        _taskController.clear();
      });
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]["completed"] = !_tasks[index]["completed"];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile.png"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Recherche(),
            const SizedBox(height: 25),
            const Text(
              "All ToDos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return TaskItem(
                    title: task["title"],
                    completed: task["completed"],
                    onToggle: () => _toggleTask(index),
                    onDelete: () => _deleteTask(index),
                  );
                },
              ),
            ),

          
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  InputAjouterTache(taskController: _taskController),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: _addTask,
                    backgroundColor: Colors.purple,
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputAjouterTache extends StatelessWidget {
  const InputAjouterTache({
    super.key,
    required TextEditingController taskController,
  }) : _taskController = taskController;

  final TextEditingController _taskController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _taskController,
        decoration: InputDecoration(
          hintText: "Ajouter une nouvelle tâche",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}


class Recherche extends StatelessWidget {
  const Recherche({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final bool completed;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.title,
    required this.completed,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Checkbox(
          value: completed,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            decoration: completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
