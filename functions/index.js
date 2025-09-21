const functions = require("firebase-functions");
const axios = require("axios");

const CHAPA_SECRET_KEY = "CHASECK_TEST-4lyLInWOW8RzJZD2PZUpsj9DkTxCsjCv"; // use your TEST key

exports.initializePayment = functions.https.onCall(async (data, context) => {
  try {
    const response = await axios.post(
      "https://api.chapa.co/v1/transaction/initialize",
      {
        amount: data.amount,
        currency: "ETB",
        email: data.email,
        first_name: data.firstName,
        last_name: data.lastName,
        tx_ref: data.txRef,
        callback_url: "https://us-central1-ecommerceapp-6df02.cloudfunctions.net/paymentCallback",
      },
      {
        headers: {
          Authorization: `Bearer ${CHAPA_SECRET_KEY}`,
          "Content-Type": "application/json",
        },
      }
    );

    return response.data;
  } catch (error) {
    console.error("Chapa init error:", error.response?.data || error.message);
    throw new functions.https.HttpsError(
      "unknown",
      "Payment initialization failed",
      error.response?.data || error.message
    );
  }
});
