import 'package:flutter/material.dart';

import '../Models/user_model.dart';
import '../Services/secure_storage.dart';
import '../ViewModels/user_view_model.dart';

import 'Custom_widgets/app_bar.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final double size;

  CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: groupValue == value ? Colors.black : Colors.grey,
          ),
        ),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: groupValue == value ? Colors.black : Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final SecureStorage _secureStorage = SecureStorage();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedGender = '';
  bool isCreatingUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Inscription',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60.0),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: const Text(
                    'Sexe',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      children: [
                        CustomRadio<String>(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                          size: 10.0, // Adjust the size here
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text('Homme'),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        CustomRadio<String>(
                          value: 'Femme',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                          size: 10.0, // Adjust the size here
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text('Femme'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Mail',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              isCreatingUser
                  ? const CircularProgressIndicator() // Show a waiting circle while creating the user
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async {
                        final firstName = firstNameController.text;
                        final lastName = lastNameController.text;
                        final gender = selectedGender;
                        final email = emailController.text;
                        final password = passwordController.text;

                        final user = User(
                          prenomConsommateur: firstName,
                          nomConsommateur: lastName,
                          sexeConsommateur: gender,
                          pathConsommateur: '',
                          mailConsommateur: email,
                          passwordConsommateur: password,
                          paymentMethodeId: '',
                        );

                        setState(() {
                          isCreatingUser =
                              true; // Set the flag to true to show the waiting circle
                        });

                        int idConsommateur =
                            await UserViewModel().userCreation(user);

                        await _secureStorage.setLastName(lastName);

                        await _secureStorage.setEmail(email);
                        await _secureStorage.setFirstName(firstName);
                        await _secureStorage.setGender(gender);
                        await _secureStorage.setId(idConsommateur.toString());

                       Navigator.pop(context);
                      },
                      child: const Text('S\'inscrire'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
