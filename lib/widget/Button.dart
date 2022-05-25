import 'package:flutter/material.dart';


class Button extends StatelessWidget {
   String? title;
  VoidCallback? onPress;
   Button({Key? key,
      this.title,
      
      this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 45,
        width: 455,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          
          color:Color.fromARGB(255, 101, 143, 207)
          ),

        child: Stack(
          children: [
            
            Visibility(
              child: Center(
                child: Text(
                  title ?? "button",
            
            style:const TextStyle(color: Colors.white),
          ),
        ),
      ),
        
        ],
        )
      ),
    );
    
  }
}
