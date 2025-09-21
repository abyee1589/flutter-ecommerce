import 'dart:convert';
import 'package:http/http.dart' as http;

class ChapaPaymentService {
  final String amount;
  final String currency;
  final String email;
  final String firstName;
  final String lastName;
  final String txRef;
  final String callbackUrl;

  ChapaPaymentService({
    required this.amount,
    required this.currency,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.txRef,
    required this.callbackUrl,
  });

  /// ⚡ Use your SECRET KEY (starts with CHASECK_), not Public Key
  final String secretKey = "CHASECK_TEST-4lyLInWOW8RzJZD2PZUpsj9DkTxCsjCv"; // from Chapa Dashboard

  /// Initialize payment and get checkout URL
  Future<String?> initializePayment() async {
    final url = Uri.parse("https://api.chapa.co/v1/transaction/initialize");

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "amount": amount,
        "currency": currency,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "tx_ref": txRef,
        "callback_url": callbackUrl,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["data"]["checkout_url"]; // ✅ Chapa payment page URL
    } else {
      print("Chapa init failed: ${response.body}");
      return null;
    }
  }

  /// Verify payment status
  Future<bool> verifyPayment(String txRef) async {
    final url = Uri.parse("https://api.chapa.co/v1/transaction/verify/$txRef");

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $secretKey",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // ✅ Chapa returns full details — success if payment is confirmed
      return data["data"]["status"] == "success";
    } else {
      print("Chapa verify failed: ${response.body}");
      return false;
    }
  }
}
