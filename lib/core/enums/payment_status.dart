// enum PaymentStatus {
//   pending,
//   paid,
//   writeOff;

//   static PaymentStatus fromString(String status) {
//     switch (status) {
//       case "pending":
//         return PaymentStatus.pending;
//       case "paid":
//         return PaymentStatus.paid;
//       case "writeOff":
//         return PaymentStatus.writeOff;
//       default:
//         return PaymentStatus.pending;
//     }
//   }

// /*************  ✨ Windsurf Command ⭐  *************/
// /// Returns a human-readable string representation of this [PaymentStatus].
// /// 
// /// e.g. "Unpaid", "Paid", "Settled".
// /// 
// /// This is used for displaying the status of a bill in the UI.
// /*******  336a5135-521f-467a-8e58-0331810f582b  *******/
//   String toDisplay() {
//     switch (this) {
//       case PaymentStatus.pending:
//         return "Unpaid";
//       case PaymentStatus.paid:
//         return "Paid";
//       case PaymentStatus.writeOff:
//         return "Settled";
//       default:
//         return "pending";
//     }
//   }
// }
