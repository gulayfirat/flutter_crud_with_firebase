part of "../login_view.dart";

extension Loginbutton on LoginView {
  Row loginButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('login with google',
          style: TextStyle(color: Colors.black, fontSize: 20)),
      const SizedBox(
        width: 15,
      ),
      Image.asset(
        'assets/images/googleicon.png',
        width: 25,
        height: 25,
      )
    ]);
  }
}
