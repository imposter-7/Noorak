import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lastversion/roomdetails.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 249, 247, 247),
    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(179, 255, 255, 255),
      ),
      
      labelText: text,
      labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.7),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}



Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}


class Rooms extends StatefulWidget {
  final String title, image;
  // final VoidCallback onToggle;
  final Color roomColor;

  const Rooms({
    key,
    required this.title,
    required this.image,
    // required this.onToggle,
    required this.roomColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  bool _switchValue = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      child: Stack(
        children: [
          SizedBox(
            height: 60.0,
          ),
           GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage("images/${widget.image}.png"),
                  fit: BoxFit.cover,
                  color: widget.roomColor,
                  colorBlendMode: BlendMode.darken,
                  height: 120,
                  width: double.infinity,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomDetail()),
              );
            },
          ),
      

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text(
              widget.title.toString().toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
                  
            ),
            
          ),
        
        ],
      ),
    );
  }
}
