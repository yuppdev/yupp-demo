import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yupp_demo/login_mail/auth.dart';

class Register extends StatefulWidget {
  final Function toggleScreen;
  const Register({Key? key, required this.toggleScreen}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20
          ),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Create account to continue',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (val) =>
                  val!.isNotEmpty ? null : 'Enter a email address',
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (val) =>
                  val!.length < 6 ? 'Enter more than 6 characters' : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 8.0,
                ),
                MaterialButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      print("Email: ${_emailController.text.trim()}");
                      print("Email: ${_passwordController.text.trim()}");
                      await loginProvider.register(_emailController.text.trim(), _passwordController.text.trim());
                    }
                  },
                  height: 60,
                  minWidth: loginProvider.isLoading ? null : double.infinity,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: loginProvider.isLoading
                      ? CircularProgressIndicator()
                      : Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () => widget.toggleScreen(),
                      child: Text('Login'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
