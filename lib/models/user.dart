//  User and User Data Classes
class User{

  final String uid;

  User({ this.uid });

}

class UserData{

  final String uid;
  final String name;
  final bool isAdmin;
  final String location;
  final int temperature;
  final int restingTime;

  List<double> latLon;

//  Constructor calls conversion function
  UserData({ this.uid, this.name, this.isAdmin, this.location, this.temperature, this.restingTime}) : latLon = convertToCoordinatesUser(location);
}

//  Conversion Function
List<double> convertToCoordinatesUser(String location){
  if(location.length >= 18 && location.length <= 22){
    double var1;
    double var2 = 0;
    int adder;
    int adder2;
    bool chk = false;
    if(location.indexOf(' ') == 6)
    {
      var1 = double.parse(location.substring(0, 6));
      adder = -1;
    }
    else if(location.indexOf(' ') == 7)
    {
      var1 = double.parse(location.substring(0, 7));
      adder = 0;
    }
    else
    {
      var1 = double.parse(location.substring(0, 8));
      adder = 1;
    }
    if(location.indexOf(' ', 13) == (17 + adder) && chk == false)
    {
      var2 = double.parse(location.substring((11 + adder), (17 + adder)));
      adder2 = adder - 1;
      chk = true;
    }
    else if(location.indexOf(' ', 13) == (18 + adder) && chk == false)
    {
      var2 = double.parse(location.substring((11 + adder), (18 + adder)));
      adder2 = adder;
      chk = true;
    }
    else if(location.indexOf(' ', 13) == (19 + adder) && chk == false)
    {
      var2 = double.parse(location.substring((11 + adder), (19 + adder)));
      adder2 = adder + 1;
      chk = true;
    }
    if(location[8 + adder] == 'N'){
      var1 = var1;
    }
    else{
      var1 = var1*(-1);
    }
    if(location[19 + adder2] == 'E'){
      var2 = var2;
    }
    else{
      var2 = var2*(-1);
    }
    return [var1, var2];
  }
  else{
    return null;
  }
}