import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'E9E9575C-9102-4EB8-BC61-7B481A19DF9A';
//String url =
//  'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apiKey';

class NetworkHelper {
  Future<String> getData(String coinType, String unit) async {
    //print(unit);
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$coinType/$unit?apikey=$apiKey';
    http.Response data = await http.get(Uri.parse(url));
    //print(jsonDecode(data.body)['rate']);
    //return jsonDecode(data.body);
    int temp = jsonDecode(data.body)['rate'].toInt();
    return temp.toString();
  }
}
