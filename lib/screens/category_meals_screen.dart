import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meal';

  // final String categoryId;
  // final String title;

  // CategoryMealsScreen(this.categoryId,this.title);

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryID = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMealsList = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(10),
              // child: Text(categoryMealsList[index].title),
              child: MealItem(
                  id: categoryMealsList[index].id,
                  title: categoryMealsList[index].title,
                  imageUrl: categoryMealsList[index].imageUrl,
                  affordability: categoryMealsList[index].affordability,
                  complexity: categoryMealsList[index].complexity,
                  duration: categoryMealsList[index].duration),
            );
          },
          itemCount: categoryMealsList.length,
        ),
      ),
    );
  }
}
