
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class A extends C {
//   //  super.name= "Hello";
// }

// class B extends C {
//   //  super.name = 30;
// }

// class C {
//   dynamic name;
// }

// tickTrick(C c) {
//   print(c);
// }

// printer(data) {
//   if (data is String) {
//     print(data);
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: HomePage());
//   }
// }

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   TextEditingController setter = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterManager(),
//       child: Builder(
//         builder: (context) {
//           return Scaffold(
//             appBar: AppBar(
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     context.read<CounterManager>().add(Restore());
//                   },
//                   icon: Icon(Icons.exposure_zero),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     context.read<CounterManager>().add(Decreament());
//                   },
//                   icon: Icon(Icons.minimize),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     context.read<CounterManager>().add(
//                       SetTheNumberFromTextField(theNumber: setter.text),
//                     );
//                   },
//                   icon: Icon(Icons.set_meal),
//                 ),
//               ],
//               title: TextField(
//                 controller: setter,
//                 decoration: InputDecoration(border: OutlineInputBorder()),
//               ),
//             ),
//             body: Center(
//               child: BlocBuilder<CounterManager, CounterState>(
//                 builder: (context, state) {
//                   print(state);
//                   if (state is TheNumberHasBeenChange) {
//                     return Text(
//                       state.counter.toString(),
//                       style: TextStyle(fontSize: 32),
//                     );
//                   } else if (state is RestoreToZero) {
//                     return Text(
//                       state.counter.toString(),
//                       style: TextStyle(fontSize: 32),
//                     );
//                   } else if (state is UserInputAlphabetToCounter) {
//                     return Text(
//                       state.counter.toString(),
//                       style: TextStyle(fontSize: 32),
//                     );
//                   } else {
//                     return LinearProgressIndicator();
//                   }
//                 },
//               ),
//             ),
//             floatingActionButton: BlocListener<CounterManager, CounterState>(
//               listener: (context, state) {
//                 if (state is UserInputAlphabetToCounter) {
                  
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("القيمة لح تضل نفسها لانك مدخل حروف",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
//                 }
//               },
//               child: FloatingActionButton(
//                 onPressed: () {
//                   context.read<CounterManager>().add(Increament());
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// // class C extends A {}