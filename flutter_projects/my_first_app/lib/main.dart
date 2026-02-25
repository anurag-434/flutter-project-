import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

//
// ---------------- FIRST PAGE ----------------
//

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade900,
              Colors.green.shade600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),

              Text(
                "Early\ndetection\nstarts here.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Create account"),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
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

//
// ---------------- SIGN UP PAGE (STEP 1 OF 4) ----------------
//

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool agreeTerms = false;
  bool emailOptIn = true;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Create account",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            buildTextField("First name"),
            SizedBox(height: 15),

            buildTextField("Last name"),
            SizedBox(height: 15),

            buildTextField("Email"),
            SizedBox(height: 8),

            Text(
              "You'll need to confirm your email later.",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 15),

            TextField(
              obscureText: hidePassword,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: agreeTerms,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      agreeTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "I acknowledge that I have read and agree to Stato Vital's Terms and Privacy Policy and BAA.",
                  ),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: emailOptIn,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      emailOptIn = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "Opt-in to receive emails from Stato Vital about company updates.",
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpecialtyPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

//
// ---------------- SPECIALTY PAGE (STEP 2 OF 4) ----------------
//

class SpecialtyPage extends StatefulWidget {
  @override
  _SpecialtyPageState createState() => _SpecialtyPageState();
}

class _SpecialtyPageState extends State<SpecialtyPage> {

  String selectedSpecialty = "";

  final List<String> specialties = [
    "Anesthesiology",
    "Cardiology",
    "Critical Care or Emergency Medicine",
    "Family Medicine or Geriatrics",
    "Hospitalist",
    "Infectious Disease",
    "Internal Medicine",
    "Pediatrics or Neonatology",
    "Pulmonology",
    "Surgery",
    "Veterinary Care",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account details"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          SizedBox(height: 10),

          Text(
            "2 of 4",
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(height: 5),

          Text(
            "Select specialty",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: specialties.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(specialties[index]),
                  trailing: selectedSpecialty == specialties[index]
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    setState(() {
                      selectedSpecialty = specialties[index];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
