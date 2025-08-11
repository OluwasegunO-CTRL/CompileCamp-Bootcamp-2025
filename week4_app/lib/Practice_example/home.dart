import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4_app/Practice_example/counter_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<CounterModel>(context, listen: false).reset();
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' The button has been pressed this times:',
            style: Theme.of(context).textTheme.titleMedium,),
            Consumer<CounterModel>(builder: (context, counter, child){
              return Text('${counter.count} times',
              style: Theme.of(context).textTheme.bodyMedium,);
            }),
          SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Provider.of<CounterModel>(context, listen: false).increment();
            }, child: const Text('Increment'))
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<CounterModel>(context, listen: false).decrement();
        },
        child: Icon(Icons.remove),
        ),
    );
  }
}