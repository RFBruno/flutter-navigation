import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
 
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);  

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty){
      return const  Center(
        child: Text('Nenuma refeição foi marcada como favorita!'),
      );
    }else{
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            return Mealitem(favoriteMeals[index]);
          },
        );
    }


  }
}