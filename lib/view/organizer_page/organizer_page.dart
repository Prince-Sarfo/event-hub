// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';

// class DocumentSigningPage extends StatefulWidget {
//   @override
//   _DocumentSigningPageState createState() => _DocumentSigningPageState();
// }

// class _DocumentSigningPageState extends State<DocumentSigningPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _subAccountCodeController = TextEditingController();
//   final _signatureController = TextEditingController();
//   bool _agreedToTerms = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Document')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _subAccountCodeController,
//                 decoration: InputDecoration(labelText: 'Paystack Sub Account Code'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your Paystack Sub Account Code';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _signatureController,
//                 decoration: InputDecoration(labelText: 'Type your name for signature'),
//                 validator: (value) {
//                   if (!_agreedToTerms && (value == null || value.isEmpty)) {
//                     return 'Please type your name or agree to the terms';
//                   }
//                   return null;
//                 },
//               ),
//               CheckboxListTile(
//                 title: Text('Agree to terms and conditions'),
//                 value: _agreedToTerms,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     _agreedToTerms = value!;
//                     if (_agreedToTerms) {
//                       _signatureController.clear();
//                     }
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _submitForm();
//                   }
//                 },
//                 child: Text('Submit and Sign'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _submitForm() async {
//     try {
//       String email = _emailController.text.trim();
//       String subAccountCode = _subAccountCodeController.text.trim();
//       String signature = _agreedToTerms ? 'Agreed to terms' : _signatureController.text.trim();

//       // Save the form data to Firebase
//       await FirebaseFirestore.instance.collection('signatures').add({
//         'email': email,
//         'subAccountCode': subAccountCode,
//         'signature': signature,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       // Generate a PDF or a text document (Here we assume a simple text document)
//       String documentContent = '''
//       User Email: $email
//       Paystack Sub Account Code: $subAccountCode
//       Signature: $signature
//       Date: ${DateTime.now()}
//       ''';

//       // Upload document to Firebase Storage
//       String fileName = 'signed_document_${DateTime.now().millisecondsSinceEpoch}.txt';
//       Reference storageRef = FirebaseStorage.instance.ref().child('signed_documents/$fileName');
//       await storageRef.putString(documentContent);

//       // Get the document URL
//       String documentUrl = await storageRef.getDownloadURL();

//       // Send the document via email
//       _sendEmail(email, documentUrl);

//       // Show a success message
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Document signed and sent!')));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
//     }
//   }

//   Future<void> _sendEmail(String userEmail, String documentUrl) async {
//     final String username = 'your_email@gmail.com'; // Replace with your email
//     final String password = 'your_email_password'; // Replace with your email password

//     final smtpServer = gmail(username, password);

//     final message = Message()
//       ..from = Address(username, 'Your Name')
//       ..recipients.add(userEmail)
//       ..recipients.add('developer_email@example.com') // Replace with developer's email
//       ..subject = 'Signed Document'
//       ..text = 'Please find the signed document attached.\n\nDocument URL: $documentUrl';

//     try {
//       final sendReport = await send(message, smtpServer);
//       print('Message sent: ' + sendReport.toString());
//     } on MailerException catch (e) {
//       print('Message not sent. \n' + e.toString());
//     }
//   }
// }
