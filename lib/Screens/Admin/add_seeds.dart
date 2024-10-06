import 'package:flutter/material.dart';
import 'package:mithra/SQLite/sqlite.dart';
import 'package:mithra/JsonModels/seed.dart';
import 'package:mithra/constants.dart';

class AddSeedsPage extends StatelessWidget {
  const AddSeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD SEEDS'),
        backgroundColor: kPrimaryColor,
      ),
      body: const AddSeedsBody(),
    );
  }
}

class AddSeedsBody extends StatefulWidget {
  const AddSeedsBody({Key? key}) : super(key: key);

  @override
  _AddSeedsBodyState createState() => _AddSeedsBodyState();
}

class _AddSeedsBodyState extends State<AddSeedsBody> {
  final TextEditingController seedNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.05), // Adjusted height for better positioning
            Image.asset(
              "assets/images/addseeds_page.png",
              height: 200, // Adjust the height as needed
              width: 200, // Adjust the width as needed
            ),
            SizedBox(height: size.height * 0.1),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple.withOpacity(.2),
              ),
              child: TextFormField(
                controller: seedNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Seed Name is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.grain),
                  border: InputBorder.none,
                  hintText: "Enter Seed Name",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple.withOpacity(.2),
              ),
              child: TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Quantity is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.add),
                  border: InputBorder.none,
                  hintText: "Enter Quantity",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  addSeed();
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void addSeed() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    var seed = Seed(
      seedName: seedNameController.text,
      quantity: int.parse(quantityController.text),
    );

    try {
      await dbHelper.insertSeed(seed);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Seed added successfully!')),
      );
      Navigator.pop(context); // Navigate back after adding the seed
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add seed: $e')),
      );
    }
  }
}
