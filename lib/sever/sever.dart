import 'package:dio/dio.dart';

const ID_API = "http://52.78.130.71:8080/init/user";

class Server {
  Future<void> getReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(ID_API);
    print(response.data.toString());
  }


}
Server server = Server();