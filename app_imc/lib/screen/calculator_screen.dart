import 'package:app_imc/components/circular_progress_indicator.dart';
import 'package:app_imc/components/text_form_field_component.dart';
import 'package:app_imc/controllers/calculator_controller.dart';
import 'package:app_imc/models/person.dart';
import 'package:app_imc/screen/home_screen.dart';
import 'package:flutter/material.dart';

showCalculatorIMC(BuildContext context, {Person? person, required final formKey})async{
  person = Person(name: '', height: 0.0, weight:0.0);
  await showModalBottomSheet(
backgroundColor: Colors.transparent,
context: context,
isScrollControlled: true,
builder: (context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.7, 
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20), 
    decoration: const BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    child:Column(
      children: [
        Text(
          'datos imc',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10), 
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormFieldCustom(
                      initialValue: person!.getName(),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      labelText: 'name',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'please insert a valid value';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.trim().isEmpty) {
                          person!.setName(null);
                        } else {
                        person!.setName(value);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldCustom(
                      initialValue: person.getHeight().toString(),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      labelText: 'altura',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'please insert a valid value';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.trim().isEmpty) {
                          person!.setHeight(null);
                        } else {
                          person!.setHeight(double.parse(value));
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldCustom(
                      initialValue: person.getWeight().toString(),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      labelText: 'Peso',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'please insert a valid value';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.trim().isEmpty) {
                          person!.setWeight(null);
                        } else {
                          person!.setWeight(double.parse(value));
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                
                  
                  ],
                ),
              ),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Text('cancelar'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                ),
                onPressed: () async {
                if (formKey.currentState!.validate()) {
                  showCircularLoadingDialog(context);
                  await CalculatorController().registerNewImc(person!);
                  
Navigator.of(context).push(MaterialPageRoute( builder: (context) =>const  HomeScreen()));  
                //
                //  Navigator.of(context).pop();
                  
                  }
                },
                child: Text('salvar'),
              ),
            ],
          )
        ],
      )
    );
  });
}