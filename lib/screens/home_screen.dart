import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';
class HomeScreen extends StatefulWidget {
 @override
 _HomeScreenState createState() => _HomeScreenState();   
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTap = 0;
  List<IconData> _icon = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];
  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
    // this is part for icon in boxes
    child: Container (
      height: 60.0,
      width:60.0,
      decoration: BoxDecoration(color:
      _selectedIndex == index? Theme.of(context).accentColor : Color(0xFFE7EBEE),borderRadius: BorderRadius.circular(30.0)),
      child: Icon(_icon[index],size: 25.0,color:
      _selectedIndex == index ? Theme.of(context).primaryColor :Color(0xFFB4C2C4),
      ),
      )
    );
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body:SafeArea(child: ListView(
        padding: EdgeInsets.only(top:50.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 100),
            child: Text('What would you like to find?',
            style:TextStyle( fontSize: 30.0,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _icon.asMap().entries.map((MapEntry map)=> _buildIcon(map.key)).toList(),
            ),
          ),
          SizedBox(
            height:20.0
          ),
          DestinationCarousel(),
          HotelCarousel(),
          ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTap,
        onTap: (int value) { 
          setState((){
            _currentTap = value;
        }
        );
        },
        items: [
        BottomNavigationBarItem(icon: 
        Icon(
          Icons.search,
          size: 30.0
          ),
          title: SizedBox.shrink(),
          ),
        BottomNavigationBarItem(icon: 
        Icon(
          Icons.local_pizza,
          size: 30.0
          ),
          title:SizedBox.shrink(),
          ),
        BottomNavigationBarItem( 
          icon: CircleAvatar(
            radius: 15.0,
            backgroundImage: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=adult-beard-boy-casual-220453.jpg&fm=jpg'),
          ),
          title: SizedBox.shrink(),
          )
        ],
          ),
    );
  }
}