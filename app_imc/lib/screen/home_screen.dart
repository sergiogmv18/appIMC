import 'package:app_imc/components/circular_progress_indicator.dart';
import 'package:app_imc/models/person.dart';
import 'package:app_imc/repository/repository.dart';
import 'package:app_imc/screen/calculator_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  Person person = Person();
  bool loading = true;
  List allList = [];

  /*
  * Initial setup
  * @author  SGV
  * @version 1.0 - 20220715 - initial release
  * @return  void
  */
  Future<void> initialSetup() async {
    allList = await Repository().fetchAll();
   setState(() {
     loading = false;
   });
  }

   @override
  void initState() {
    super.initState();
     initialSetup();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: Text('Calculator of bmi'),
        centerTitle: true,
      ),
      body:loading ? Center(child:circularProgressIndicator(context)) :Container(
        alignment: Alignment.topCenter,
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              for(int index = 0; index < allList.length; index++)...[
                Card(
                  elevation: 4,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child:  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [   
                          TextSpan(
                            text: 'name: ',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.amber, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: allList[index]['name'],
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                          ),
                          const TextSpan(text: '\n\n'),
                          TextSpan(
                          text: 'Peso: ',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.amber, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: allList[index]['weight'].toString(),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                          ),
                          const TextSpan(text: '\n\n'),
                          TextSpan(
                          text: 'Altura: ',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.amber, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: allList[index]['height'].toString(),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                          ),
                          const TextSpan(text: '\n\n'),
                          TextSpan(
                          text: 'total: ',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.amber, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: allList[index]['bmi'].toString(),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                          ),
                          const TextSpan(text: '\n\n'),
                          TextSpan(
                          text: 'status: ',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.amber, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: allList[index]['status'],
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                          ),
                          const TextSpan(text: '\n\n'),
                        ]
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 20,)
              ]
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()async{
          return showCalculatorIMC(context, formKey:formKey);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}