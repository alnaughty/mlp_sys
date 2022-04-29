import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();

  final TextEditingController _currentPass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _confPass = TextEditingController();
  bool obscureText = true;
  Widget customField(
    TextEditingController controller, {
    required String label,
    bool isPassword = false,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 13,
            ),
            maxLines: 1,
            keyboardType: !isPassword && label.contains("Email")
                ? TextInputType.emailAddress
                : TextInputType.text,
            obscureText: isPassword ? obscureText : false,
            decoration: InputDecoration(
              hintText: "Enter your $label",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Settings".toUpperCase()),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal:
                      constraint.maxWidth < 600 ? 20 : constraint.maxWidth * .1,
                ),
                width: constraint.maxWidth,
                color: Colors.blue.withOpacity(.1),
                child: const Text(
                  "Manage Account",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal:
                      constraint.maxWidth < 600 ? 20 : constraint.maxWidth * .1,
                ),
                width: constraint.maxWidth,
                child: Wrap(
                  children: [
                    SizedBox(
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Your email address is your identity on MLP APP and is used to log in.",
                            style: TextStyle(
                              color: Colors.black54,
                              height: 1,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: constraint.maxWidth <
                                  1100 + (constraint.maxWidth * .1)
                              ? 20
                              : 0),
                      width: 600,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                customField(_email, label: "Email Address"),
                                const SizedBox(
                                  height: 10,
                                ),
                                customField(_name, label: "Name (Optional)"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal:
                      constraint.maxWidth < 600 ? 20 : constraint.maxWidth * .1,
                ),
                width: constraint.maxWidth,
                child: Wrap(
                  children: [
                    SizedBox(
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Change Password",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Changing your password will also reset your saved credentials.",
                            style: TextStyle(
                              color: Colors.black54,
                              height: 1,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: constraint.maxWidth <
                                  1100 + (constraint.maxWidth * .1)
                              ? 20
                              : 0),
                      width: 600,
                      child: Column(
                        children: [
                          customField(_currentPass,
                              label: "Current Password", isPassword: true),
                          const SizedBox(
                            height: 30,
                          ),
                          customField(_newPass,
                              label: "New Password", isPassword: true),
                          const SizedBox(
                            height: 10,
                          ),
                          customField(_confPass,
                              label: "Confirm Password", isPassword: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
