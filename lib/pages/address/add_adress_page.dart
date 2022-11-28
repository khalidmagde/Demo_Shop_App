import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                builderAddress("contry or region"),
                buttonAddress(),
                builderAddress("street address"),
                buttonAddress(),
                builderAddress("streetaddress2"),
                buttonAddress(),
                builderAddress("state/pro/region"),
                buttonAddress(),
                builderAddress("zipcode"),
                buttonAddress(),
                builderAddress("PhoneNumber"),
                buttonAddress(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 49, 34),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Add Adress",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buttonAddress() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Add"),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: Colors.yellow)))),
    );
  }

  Column builderAddress(String txt) {
    return Column(
      children: [
        Container(alignment: Alignment.centerLeft, child: Text(txt)),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: TextField(
              //controller: controller,
              decoration: InputDecoration(
                //prefixIcon: Icon(iconData),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
