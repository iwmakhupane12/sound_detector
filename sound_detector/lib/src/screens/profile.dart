import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Profile extends StatefulWidget {
  @override
  Profile({ Key? key }) : super(key: key);

  @override
  _createProfileState createState() => _createProfileState();
}

class _createProfileState extends State<Profile>{
  // File _pickedImage;
//  PickedFile _imageFile;
 final ImagePicker _picker =  ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body :Padding(
       padding:const EdgeInsets.symmetric(horizontal: 20, vertical:20),
       child:ListView(
       children:<Widget> [
         imageProfile(),
         SizedBox(
           height: 20,
         ),
         nameTextField(),
         SizedBox(
           height: 20,
         ),
         ContactTextField(),
          SizedBox(
           height: 20,
         ),
          AddressTextField(),
           SizedBox(
           height: 20,
         ),

       ],
     ),)
    );
  }
 

  Widget nameTextField(){
    return TextFormField(
         decoration: InputDecoration(
           border: OutlineInputBorder(
             borderSide:BorderSide(
               color: Colors.teal)),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.purple,
                   width: 2)
               ),
               prefixIcon:  Icon(Icons.person,
               color: Colors.purple,),
               labelText: "Full Name",
               helperText: "Enter your name",
               hintText: "Enter Name and Surname"
               ),
    );
  }
  Widget imageProfile(){
   return Center(
      
    child: Stack( children:<Widget> [
         CircleAvatar(
          radius: 80.0,
          backgroundImage:AssetImage("assets/download.png")
          ),
           Positioned(
             bottom: 20.0,
            right: 20.0,
            child:InkWell(
              onTap: (){
                 showBottomSheet(context: context,
                 builder:((builder)=> bottomSheet())
                   );
               },
           child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
           )),
           )
      ],

  )
    );
  }


  Widget bottomSheet(){
   return Container(
       height:100.0,
       width: MediaQuery.of(context).size.width,
       margin: EdgeInsets.symmetric(
        horizontal: 20,
       vertical: 20,
     ),
        child: Column(children: <Widget>[
        Text(
          "Choose Profile photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
           height: 20,
         ),
         Row(
           mainAxisAlignment:MainAxisAlignment.center,
           children:<Widget>[
             TextButton.icon(
               icon:Icon(Icons.camera),
               onPressed: (){
            //  takePhoto(ImageSource.camera);
               },
                label: Text("camera"),
               ),
               TextButton.icon(
               icon:Icon(Icons.image),
               onPressed: (){
               // takePhoto(ImageSource.gallery);
               },
                 label: Text("Gallery"),
               ),
           ],
       )
      ]),
    );
  }
//   void takePhoto(ImageSource source) async{
//    final pickedFile = await _picker;
//    setState(() {
//    _imageFile = pickedFile ;
//       });

// }

  Widget ContactTextField(){
    return TextFormField(
         decoration: InputDecoration(
           border: OutlineInputBorder(
             borderSide:BorderSide(
               color: Colors.teal)),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.purple,
                   width: 2)
               ),
               prefixIcon:  Icon(Icons.contacts,
               color: Colors.purple,),
               labelText: "Contacts",
               helperText: "Enter your phone numbers",
               hintText: "Enter Name and Surname"
               ),
    );
  }
  Widget AddressTextField(){
    return TextFormField(
         maxLines: 6,
         decoration: InputDecoration(
           border: OutlineInputBorder(
             borderSide:BorderSide(
               color: Colors.teal)),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.purple,
                   width: 2)
               ),
               prefixIcon:  Icon(Icons.home,
               color: Colors.purple,),
               labelText: "Home Adress",
               helperText: "Enter you home address ",
               hintText: "Enter Name and Surname"
               ),
    );
  }

}
