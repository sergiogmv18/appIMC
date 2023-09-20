class Person {
  String? name;
  double? weight;
  double? height;
  double? bmi;
  String? status;
  Person({this.name, this.height = 0, this.weight = 0, this.bmi, this.status});
  
  // GET
  getName(){
    return name;
  }

  getWeight(){
    return weight;
  }

  getHeight(){
    return height;
  }

  getBmi(){
    return bmi;
  }

  getStatus(){
    return status;
  }

  // SET
  void setName(String? name){
    this.name = name;
  }

  void setWeight(double? weight){
    this.weight = weight;
  }

  void setHeight(double? height){
    this.height = height;
  }

  void setBmi(double? bmi){
    this.bmi = bmi;
  }

  void setStatus(String status){
    this.status = status;
  }

  // OTHER METHOD
  toMap(){
    return {
      'name':name,
      'weight':weight,
      'height':height,
      'bmi':bmi,
      'status': status,
    };
  }
}