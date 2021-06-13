import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  final List<Product> productList = [
    Product(
        id: "1",
        name: "Mango",
        price: 150,
        discription:
            "Mango, Mangifera indica, is an evergreen tree in the family Anacardiaceae grown for its edible fruit. The mango tree is erect and branching with a thick trunk and broad, rounded canopy. The leaves of the tree are are shiny and dark green. ... The fruit is a drupe, with an outer flesh surrounding a stone",
        imageUrl: "https://i.ytimg.com/vi/fp2TtWSPOGc/maxresdefault.jpg"),
    Product(
        id: "2",
        name: "Jackfruit",
        price: 350,
        discription:
            "The jackfruit tree is 15 to 20 metres (50 to 70 feet) tall at maturity and has large stiff glossy green leaves about 15 to 20 cm (6 to 8 inches) long. The small unisexual flowers are borne on dense inflorescences that emerge directly from the trunk and branches.",
        imageUrl:
            "https://naturebring.com/wp-content/uploads/2017/03/Jackfruit-nb-033.jpg"),
    Product(
        id: "3",
        name: "Abelia",
        price: 2150,
        discription:
            "Species formerly placed in Abelia are shrubs from 1–6 m tall, native to eastern Asia (Japan west to the Himalaya) and southern North America (Mexico); the species from warm climates are evergreen, and colder climate species deciduous. The leaves are opposite or in whorls of three, ovate, glossy, dark green, 1.5–8 cm long, turning purplish-bronze to red in autumn in the deciduous species. The flowers appear in the upper leaf axils and stem ends, 1-8 together in a short cyme; they are pendulous, white to pink, bell-shaped with a five-lobed corolla, 1–5 cm long, and usually scented. Flowering continues over a long and continuous period from late spring to fall.",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/a/ae/Abelia_chinensis_RJB1.jpg"),
    Product(
        id: "4",
        name: "Hibiscus",
        price: 250,
        discription:
            "The leaves are alternate, ovate to lanceolate, often with a toothed or lobed margin. The flowers are large, conspicuous, trumpet-shaped, with five or more petals, colour from white to pink, red, orange, peach,[7] yellow or purple,[8] and from 4–18 cm broad.Pollen grain of HibiscusFlower colour in certain species, such as H. mutabilis and H. tiliaceus, changes with age.[9] The fruit is a dry five-lobed capsule, containing several seeds in each lobe, which are released when the capsule dehisces (splits open) at maturity. It is of red and white colours. It is an example of complete flowers.",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Hibiscus_flower_TZ.jpg/330px-Hibiscus_flower_TZ.jpg"),
    Product(
        id: "5",
        name: "Bowenia",
        price: 1250,
        discription:
            "The genus Bowenia includes two living and two fossil species of cycads in the family Stangeriaceae, sometimes placed in their own family Boweniaceae.[1] They are entirely restricted to Australia. The two living species occur in Queensland. B. spectabilis grows in warm, wet, tropical rainforests, on protected slopes and near streams, primarily in the lowlands of the Wet Tropics Bioregion.",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Bowenia_Spectabilis_2_years.jpg/330px-Bowenia_Spectabilis_2_years.jpg"),
    Product(
        id: "6",
        name: "Butia",
        price: 1000,
        discription:
            "These are 'feather palms', having pinnate leaves up to 3m long including petiole which usually have a distinct downward arch. The species vary from nearly stemless plants rarely exceeding 40 cm tall (e.g. Butia campicola) to small trees up to 12m tall",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Butia_capitata_-_Villa_Thuret_-_DSC04803.JPG/1280px-Butia_capitata_-_Villa_Thuret_-_DSC04803.JPG"),
  ];
  List<Product> get items {
    return [...productList];
  }

  List<Product> allItem() {
    return productList;
  }

  List<Product> favItem() {
    return [...productList.where((element) => element.isFavorite == true)];
  }

  Product findId(String id1) {
    return productList.firstWhere((prod) => prod.id == id1);
  }

  void addProduct() {
    // productList.add(value);
    notifyListeners();
  }

  void deleteProduct(String id) {
    productList.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
