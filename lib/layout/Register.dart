import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController nameController,
      phoneNoController,
      passwordController,
      usernameController,
      emailController;
  final _formKey = GlobalKey<FormState>();
  String gender = "Male"; // Default gender
  final String url = "https://example.com/"; // Replace with your actual URL

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneNoController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNoController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> postData() async {
    var uri = Uri.parse(url + "patient/patient_reg_app/");
    try {
      Response response = await post(
        uri,
        body: {
          'patient_name': nameController.text,
          'username': usernameController.text,
          'password': passwordController.text,
          'email': emailController.text,
          'phone': phoneNoController.text,
          'gender': gender,
        },
      );

      if (response.statusCode == 200) {
        // Successful registration
        print('Registration successful');
        // Optionally navigate to a success screen or display a message
      } else {
        // Handle errors
        print('Registration failed with status: ${response.statusCode}.');
        // Display an error message to the user
      }
    } catch (e) {
      print('Error during registration: $e');
      // Handle network errors or other exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 39, 126, 180),
      //   centerTitle: true,
      //   title: const Text('Register'),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blue.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "Register Patient",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 15, 94, 144),
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildInputField(
                              nameController, "Enter Your name", Icons.person),
                          _buildGenderSelector(),
                          _buildInputField(phoneNoController,
                              "Enter Your Phone Number", Icons.phone),
                          _buildInputField(emailController,
                              "Enter Your Email-id", Icons.email),
                          _buildInputField(usernameController,
                              "Enter the Username ", Icons.verified_user),
                          _buildInputField(passwordController,
                              "Enter the Password ", Icons.password_outlined,
                              isPassword: true),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 15, 94, 144),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                elevation: 5,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await postData();
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              // icon: const Icon(Icons.send, color: Colors.white),
                              label: const Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: (value) {
          if (controller == nameController ||
              controller == usernameController) {
            if (value == null || value.trim().isEmpty) {
              return '${label.split(" ")[2]} is required';
            }
          }
          if (controller == phoneNoController) {
            if (value == null || !RegExp(r'^\d{10}$').hasMatch(value)) {
              return 'Enter a valid 10-digit phone number';
            }
          }
          if (controller == emailController) {
            if (value == null || !value.contains('@')) {
              return 'Enter a valid email';
            }
          }
          if (controller == passwordController &&
              (value == null || value.length < 6)) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Gender",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile<String>(
                  title: const Text("Male"),
                  value: "Male",
                  groupValue: gender,
                  onChanged: (String? value) => setState(() => gender = value!),
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: gender,
                  onChanged: (String? value) => setState(() => gender = value!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
