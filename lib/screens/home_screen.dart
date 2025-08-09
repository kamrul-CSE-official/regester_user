import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> gender = ['Male', 'Female', 'Other'];
  final List<String> approves = ['YES', 'NO'];

  String? selectedGender;
  String? selectedApproval;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // List to store submitted data
  List<String> submittedUsers = [];

  void handleSubmit() {
    String first = firstNameController.text.trim();
    String last = lastNameController.text.trim();
    String email = emailController.text.trim();

    if (first.isEmpty ||
        last.isEmpty ||
        email.isEmpty ||
        selectedGender == null ||
        selectedApproval == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() {
      submittedUsers.add(
        "$first $last | $email | $selectedGender | Approved: $selectedApproval",
      );

      // Clear fields
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      selectedGender = null;
      selectedApproval = null;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("User Added")));
  }

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
                  "Register User",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.5),
                ),
              ),
              Divider(height: 15.6, thickness: 3.5),
              SizedBox(height: 20.5),

              // First Name
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: "Enter Your First Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.5),

              // Last Name
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: "Enter Your Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.5),

              // Gender Dropdown
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

              // Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Enter Your Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.5),

              // Approve Section
              Text("Is Approve ?"),
              SizedBox(height: 8.5),
              ...approves.map((option) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(4.5)),
                    ),
                    child: RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: selectedApproval,
                      onChanged: (String? value) {
                        setState(() {
                          selectedApproval = value;
                        });
                      },
                    ),
                  ),
                );
              }).toList(),

              SizedBox(height: 20),

              // Submit Button
              GestureDetector(
                onTap: handleSubmit,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.all(20.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.5,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.send, color: Colors.white),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Display Submitted Users
              if (submittedUsers.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Submitted Users:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...submittedUsers.map(
                      (user) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(user),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
