import 'package:smartbevmobile2/Models/user_model.dart';
import 'package:smartbevmobile2/Services/user_service.dart';

class UserViewModel /*extends ChangeNotifier*/ {
  Future<int> userCreation(User user) async {
    int id = await UserAPI().createUser(user);
    return id;
  }
}
