import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> gender = ['Male', 'Female', 'Other'];
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reg +", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Regester User",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.5),
                ),
              ),
              Divider(height: 15.6, thickness: 3.5),
              SizedBox(height: 20.5),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter Your First Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.5),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter Your Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.5),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Gender",
                  border: OutlineInputBorder(),
                ),
                value: selectedGender,
                items: gender.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              SizedBox(height: 15.5),

              TextField(
                decoration: InputDecoration(
                  labelText: "Enter Your Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.5),
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
