import 'dart:convert';
import 'package:http/http.dart' as http;

class CommonService {
  static createRideReq({
    required double pickupLat,
    required double pickupLng,
    required double destLat,
    required double destLng,
    required String city,
  }) async {
    try {
      // Map<String, dynamic> x = await Constants.fetchResult();
      // print(dialCode.runtimeType);
      var response = await http.post(
        Uri.parse('https://chola-web-app.azurewebsites.net/api/ride/initiate'),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${x['jwt']}',
        },
        body: jsonEncode({
          "pickupLatitude": pickupLat,
          "pickupLongitude": pickupLng,
          "dropLatitude": destLat,
          "dropLongitude": destLng,
          "city": city,
          "ride_type": 0,
        }),
      );
      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create Ride Request.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<dynamic>> getCarInfo({
    required double pickupLat,
    required double pickupLng,
    required double destLat,
    required double destLng,
    required String city,
  }) async {
    try {
      // Map<String, dynamic> x = await Constants.fetchResult();
      var response = await http.get(
        Uri.parse(
            'https://chola-web-app.azurewebsites.net/api/ride/get-prices-as-per-vehicletypes?pickupLocation=${pickupLat},${pickupLng}&dropLocation=${destLat},${destLng}&city=${city}'),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${x['jwt']}',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzcsImZpcnN0TmFtZSI6IlJpZGVyIiwibGFzdE5hbWUiOiJTaW5naCIsImNvdW50cnlDb2RlIjoiKzkxIiwicGhvbmVObyI6IjkwODc2NzQ1NjMiLCJwaG9uZU5vVmVyaWZpZWQiOmZhbHNlLCJlbWFpbCI6InNpbmdoc3VqYWw0NjZAZ21haWwuY29tIiwiZW1haWxWZXJpZmllZCI6ZmFsc2UsInZlcmlmaWVkIjpmYWxzZSwidXNlclR5cGUiOjAsImRvYiI6IjE5ODYtMTItMDJUMTg6MzA6MDAuMDAwWiIsImdlbmRlciI6MCwicHJvZmlsZUltYWdlIjpudWxsLCJibG9vZEdyb3VwIjowLCJyZWdpc3RlcmVkT24iOiIyMDI0LTA0LTA2VDE2OjU5OjAxLjc2OFoiLCJ1cGRhdGVkT24iOiIyMDI0LTA0LTA2VDE3OjMxOjI3LjcwOFoiLCJpc0Jhbm5lZCI6ZmFsc2UsImJhbm5lZEJ5SWQiOm51bGwsImJhbm5lZFJlYXNvbiI6bnVsbCwiaXNUZW1wRGVsZXRlZCI6ZmFsc2UsImNpdHkiOm51bGwsInN0YXRlIjpudWxsLCJjb3VudHJ5IjpudWxsLCJvdHAiOjQ3NDcwNiwiZHJpdmVyIjpudWxsLCJyaWRlciI6eyJpZCI6Nn0sImlhdCI6MTcxNDY0OTgxOX0.8yRPEyYxlYVBEwKcOU2dC1XGf3W7hhQ2XIzpbTJKskg',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['infoOfVehicleTypes'];
        return data;
      } else {
        throw Exception('Failed to get supportNo');
      }
    } catch (e) {
      throw Exception('Failed to get supportNo: $e');
    }
  }

  static getAvailableDriver({
    required double pickupLat,
    required double pickupLng,
    required double destLat,
    required double destLng,
    required String city,
    required int vehicleType,
    required int rideReqID,
    required double fare,
  }) async {
    try {
      // Map<String, dynamic> x = await Constants.fetchResult();
      var response = await http.get(
        Uri.parse(
            "https://chola-web-app.azurewebsites.net/api/ride/get-available-driver?pickupLocation=$pickupLat,$pickupLng&dropLocation=$destLat,$destLng&city=$city&vehicleType=$vehicleType&rideRequestId=$rideReqID&fare=$fare"),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${x['jwt']}',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzcsImZpcnN0TmFtZSI6IlJpZGVyIiwibGFzdE5hbWUiOiJTaW5naCIsImNvdW50cnlDb2RlIjoiKzkxIiwicGhvbmVObyI6IjkwODc2NzQ1NjMiLCJwaG9uZU5vVmVyaWZpZWQiOmZhbHNlLCJlbWFpbCI6InNpbmdoc3VqYWw0NjZAZ21haWwuY29tIiwiZW1haWxWZXJpZmllZCI6ZmFsc2UsInZlcmlmaWVkIjpmYWxzZSwidXNlclR5cGUiOjAsImRvYiI6IjE5ODYtMTItMDJUMTg6MzA6MDAuMDAwWiIsImdlbmRlciI6MCwicHJvZmlsZUltYWdlIjpudWxsLCJibG9vZEdyb3VwIjowLCJyZWdpc3RlcmVkT24iOiIyMDI0LTA0LTA2VDE2OjU5OjAxLjc2OFoiLCJ1cGRhdGVkT24iOiIyMDI0LTA0LTA2VDE3OjMxOjI3LjcwOFoiLCJpc0Jhbm5lZCI6ZmFsc2UsImJhbm5lZEJ5SWQiOm51bGwsImJhbm5lZFJlYXNvbiI6bnVsbCwiaXNUZW1wRGVsZXRlZCI6ZmFsc2UsImNpdHkiOm51bGwsInN0YXRlIjpudWxsLCJjb3VudHJ5IjpudWxsLCJvdHAiOjQ3NDcwNiwiZHJpdmVyIjpudWxsLCJyaWRlciI6eyJpZCI6Nn0sImlhdCI6MTcxNDY0OTgxOX0.8yRPEyYxlYVBEwKcOU2dC1XGf3W7hhQ2XIzpbTJKskg',
          // Add any additional headers if required
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else if (response.statusCode == 404) {
        Map<String, dynamic> data = json.decode(response.body);

        return {'driverId': data['error']};
      } else {
        throw Exception(
            'Failed to get Driver Available : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get Available Driver: $e ');
    }
  }
}
