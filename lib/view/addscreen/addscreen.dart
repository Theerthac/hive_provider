// import 'package:flutter/material.dart';
// import 'package:mini/dbfunctions/functions/dbfunctions.dart';

// import 'package:mini/model/person.dart';
// import 'package:mini/view/transactionscreen/transactionscreen.dart';

// final _nameController = TextEditingController();
// final _ageController = TextEditingController();
// final _clsController = TextEditingController();
// final _addressController = TextEditingController();

// class AddStudentWidget extends StatelessWidget {
//   const AddStudentWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Name',
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: _ageController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Age',
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: _clsController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Class',
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Addresss',
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   onAddStudentButtonClicked(context);
//                 },
//                 icon: const Icon(Icons.add),
//                 label: const Text('Add Student'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> onAddStudentButtonClicked(BuildContext context) async {
//     final name = _nameController.text.trim();
//     final age = _ageController.text.trim();
//     final cls = _clsController.text.trim();
//     final address = _addressController.text.trim();
//     if (name.isEmpty || age.isEmpty || cls.isEmpty || address.isEmpty) {
//       return;
//     } else {
//       final student = Person(name: name, age: age, cls: cls, address: address);

//       addStudent(student);

//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => ListStudentWidget(),
//         ),
//       );
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/addscreenprovider.dart';

class AddStudentWidget extends StatelessWidget {
  const AddStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<AddScreenProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  TextFormField(
                    controller: value.nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: value.ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: value.clsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Class',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: value.addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Address',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Provider.of<AddScreenProvider>(context, listen: false)
                          .onbuttonclikedaddStudent(context);
                      // studentProvider.addStudent(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Student'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
