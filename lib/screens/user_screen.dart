import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/models/data_model.dart';
import 'food_list.dart';


class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (_) => Data(),
      child: MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodList()));
            },
            child: Icon(Icons.forward),
          ),
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyTextField(),
        ),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: false).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(0.0),
              ),
              borderSide: new BorderSide(
                color: Colors.black,
                width: 1.0,
              ))),
      onChanged: (newText) {
        Provider.of<Data>(context).changeString(newText);
      },
    );
  }
}
