import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
class MealItem extends StatelessWidget {
 final String imageUrl;
 final String title;
 final int duration;
 final Complexity complexity;
 final Affordability affordability;
 final String id ;
 final Function removedItem ;
 MealItem({ @required this.imageUrl, this.title, this.duration, this.complexity, this.affordability, this.id,@required this.removedItem}) ;

 String get complexityText{
  switch(complexity){
    case Complexity.Simple : return 'Simple'; break ;
    case Complexity.Challenging: return 'Challenging'; break ;
    case Complexity.Hard: return 'Hard'; break ;
    default: return 'Unknown';
  }
 }
 String get affordText{
  switch(affordability){
    case Affordability.Affordable : return 'Affordable'; break ;
    case Affordability.Luxurious: return 'Luxurious'; break ;
    case Affordability.Pricey: return 'Hard'; break ;
    default: return 'Unknown';
  }
 }
 void selectedMeal(BuildContext ctx){
   Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,arguments: id).then((result) =>{
       if(result != null){
         removedItem(result)
   }}
   );
 }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children:  [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,height: 200,width: double.infinity,fit: BoxFit.cover),
                ),
                Positioned(
                    bottom: 20,
                    right: 5,
                    child: Container(
                        width: 300,
                        color: Colors.black45,
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                        child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white), softWrap: true,overflow: TextOverflow.fade,)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('${duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text(affordText)
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
