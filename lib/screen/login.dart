import 'package:flutter/material.dart';
import 'package:flutter_todo_list/animations/flip_effect.dart'; 
import 'package:flutter_todo_list/model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // Ajoutez un AnimationController pour gérer l'animation
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Initialisez l'AnimationController
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500), // Durée de l'animation
      vsync: this,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _animationController.dispose(); // N'oubliez pas de disposer le contrôleur
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String username = _nameController.text;
      String password = _passwordController.text;

      final user = users.firstWhere(
        (user) => user.username == username && user.password == password,
        orElse: () => User(username: '', password: ''),
      );

      if (user.username.isEmpty) {
        setState(() {
          _errorMessage = 'Nom d\'utilisateur ou le mot de passe est incorrect.';
        });
      } else {
        // Déclenchez l'animation avant la navigation
        _animationController.forward().then((_) {
          Navigator.pushNamed(context, '/home');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bienvenu à votre ToDo List",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Connexion",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 60),

                // Champ Username
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom d\'utilisateur';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Champ Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    }
                    if (value.length < 6) {
                      return 'Le mot de passe doit contenir au moins 6 caractères';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Bouton Login avec animation de flip
                CardFlipEffect(
                  controller: _animationController, 
                  duration: Duration(milliseconds: 1000), 
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Affichage des erreurs
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),

                // Bouton "Create an account"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous n'aviez pas de compte ! 😔"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text("S'incrire 😎"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}