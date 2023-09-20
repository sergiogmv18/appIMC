import 'package:app_imc/models/person.dart';
import 'package:app_imc/repository/repository.dart';

class CalculatorController{

  Future<void>registerNewImc(Person person)async{
    List allValue = await Repository().fetchAll();
    double heightInMeters = person.getHeight() / 100; 
    double bmi = person.getWeight() / (heightInMeters * heightInMeters);
    if(!bmi.isNaN){
      person.setBmi(bmi);
      String status = classificationBmi(bmi);
      person.setStatus(status);
    }
    allValue.add(person.toMap());
    await Repository().saveLocaly(listOfCalculator: allValue);
  }




  // Get Classification BMI  
  static String classificationBmi(double bmi) {
    String clasification ='';
    switch(bmi){
      case < 16:
        clasification = 'Magreza grave';
        break;
      case 16:
      case < 17: 
        clasification = 'Magreza moderada';
        break;
      case 17:
      case < 18.5:
        clasification = 'Magreza leve';
        break;
      case 18.5:
      case < 25:
        clasification = 'Saudavel';
        break;
      case 25:
      case < 30:
        clasification = 'Sobrepeso';
        break;
      case 30:
      case < 35:
        clasification = 'Obesidade Grau I';
        break;
      case 35:
      case < 40:
        clasification = 'Obesidade Grau II (severa)';
        break;
      case >= 40:
        clasification = 'Obesidade Grau III (moderada)';
      break;
    }
    return clasification;
  }
}