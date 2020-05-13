import 'package:newsproject/model/Category.dart';
List<Category> getCategoryList()
{
  List<Category> categorylist=  new List<Category>();
  Category category = new Category();
  //1
  category.C_title="Business";
  category.C_imageUrl="https://images.unsplash.com/photo-1529400971008-f566de0e6dfc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorylist.add(category);

  //2
  category= new Category();
  category.C_title="Entertainment";
  category.C_imageUrl="https://images.unsplash.com/photo-1576379278672-c1664525be40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorylist.add(category);
  //3
  category= new Category();
  category.C_title="Science";
  category.C_imageUrl="https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorylist.add(category);
  //4
  category= new Category();
  category.C_title="Health";
  category.C_imageUrl="https://images.unsplash.com/photo-1538805060514-97d9cc17730c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorylist.add(category);
  //5
  category= new Category();
  category.C_title="General";
  category.C_imageUrl="https://images.unsplash.com/photo-1560884322-b98251a83c7b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorylist.add(category);
  //6
  category= new Category();
  category.C_title="Sports";
  category.C_imageUrl="https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorylist.add(category);
  //7
  category= new Category();
  category.C_title="Technology";
  category.C_imageUrl="https://images.unsplash.com/photo-1535378917042-10a22c95931a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categorylist.add(category);

  return categorylist;
}