import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key, required this.buttons}) : super(key: key);

  final primaryColor = Colors.redAccent;
  final secondaryColor = Colors.red;
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);
  final List<ItemNavbar> buttons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttons,
        ),
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  ItemNavbar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final GlobalKey gkey = GlobalKey();

  final primaryColor = Color.fromARGB(255, 230, 230, 230);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white10
          ),
         
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  icon,
                  size: 25,
                  color: selected ? primaryColor : Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Baseline(
                  baseline: 15,
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 15,
                        height: .1,
                        color: selected
                            ? primaryColor
                            : Colors.grey.withOpacity(.75)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
