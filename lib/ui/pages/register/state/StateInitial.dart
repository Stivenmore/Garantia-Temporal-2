import 'package:flutter/material.dart';
import 'package:flutter_y_sqflite/domain/cubit/firebase_cubit.dart';
import 'package:flutter_y_sqflite/ui/pages/view_register/view_register.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateInitial extends StatefulWidget {
  StateInitial({
    Key key,
  }) : super(key: key);

  @override
  _StateInitialState createState() => _StateInitialState();
}

class _StateInitialState extends State<StateInitial> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  List direction = [];
  TextEditingController lastname = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  halpertodate() async {
    DateTime _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (_date != null) {
      setState(() {
        datecontroller.text = DateFormat('MMM dd, yyyy').format(_date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FirebaseCubit>();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffE04536),
          onPressed: () async {
            setState(() {
              loading = true;
            });
            await cubit.getDate().whenComplete(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewRegister(),
                  ));
            });
          },
          child: loading == true
              ? CircularProgressIndicator(
                  backgroundColor: Color(0xffE04536),
                )
              : Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 58,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Add User',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 42,
                ),
                Name(name: name),
                SizedBox(
                  height: 10,
                ),
                LastName(lastname: lastname),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: datecontroller,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a date' : null,
                    onTap: () async {
                      await halpertodate();
                    },
                    decoration: InputDecoration(
                        labelText: 'Date of birth',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE04536)),
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Address(
                    size: size,
                    addresscontroller: addresscontroller,
                    direction: direction),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () async {
                    print(
                        '$datecontroller.text+ $lastname.text + $name.text + $direction');
                    if (_formKey.currentState.validate()) {
                      await context
                          .read<FirebaseCubit>()
                          .setData(
                              name: name.text,
                              lastname: lastname.text,
                              date: datecontroller.text,
                              direction: direction)
                          .whenComplete(() {
                        setState(() {
                          datecontroller.clear();
                          lastname.clear();
                          direction.clear();
                          name.clear();
                        });
                      });
                    } else {
                      print('no validate');
                    }
                  },
                  child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffE04536)),
                      child: Center(
                        child: Text(
                          'Add User',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Address extends StatelessWidget {
  const Address({
    Key key,
    @required this.size,
    @required this.addresscontroller,
    @required this.direction,
  }) : super(key: key);

  final Size size;
  final TextEditingController addresscontroller;
  final List direction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: size.width * 0.7,
            child: TextFormField(
              controller: addresscontroller,
              validator: (value) =>
                  direction.isEmpty ? 'Please enter a address' : null,
              decoration: InputDecoration(
                  labelText: 'address',
                  hintText: 'Add your address and press save to save it.',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE04536)),
                      borderRadius: BorderRadius.circular(16))),
            ),
          ),
          TextButton(
            onPressed: () {
              if (addresscontroller.text.isNotEmpty) {
                direction.add(addresscontroller.text);
                print(direction);
                addresscontroller.clear();
              } else {}
            },
            child: Text(
              '  Save',
              style: TextStyle(color: Color(0xffE04536), fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class LastName extends StatelessWidget {
  const LastName({
    Key key,
    @required this.lastname,
  }) : super(key: key);

  final TextEditingController lastname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) => value.isEmpty ? 'Please enter a lastName' : null,
        controller: lastname,
        decoration: InputDecoration(
            labelText: 'LastName',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE04536)),
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    Key key,
    @required this.name,
  }) : super(key: key);

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) =>
            value.trim().isEmpty ? 'Please enter a Name' : null,
        controller: name,
        decoration: InputDecoration(
            labelText: 'Name',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}
