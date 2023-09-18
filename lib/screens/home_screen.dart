
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nymble_mt/models/api_response_model.dart';
import 'package:nymble_mt/provider/theme_provider.dart';
import 'package:nymble_mt/widgets/carousel_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;
  late ApiResponse apiResponse;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    loadApi();
    super.initState();
  }

  Future<void> loadApi() async{
    apiResponse=  ApiResponse.fromJson( {
      "app":{
        "theme":"light"
      },
      "widgets":[
        {
          "type":"banner",
          "image":"https://cdn.pixabay.com/photo/2016/12/26/17/28/spaghetti-1932466_1280.jpg",
          "header_text":"New Recipe",
          "footer_text":"Cook Chicken Curry",
          "footer_icon":true
        },
        {
          "type":"banner",
          "color":"blue",
          "header_text":"Meal Planner",
          "footer_text":"Plan your meals",
          "footer_icon":false
        },
        {
          "type":"banner",
          "color":"blue",
          "header_text":"Meal Planner",
          "footer_text":"Plan your meals",
          "footer_icon":false
        },
        {
          "type":"banner",
          "color":"blue",
          "header_text":"Meal Planner",
          "footer_text":"Plan your meals",
          "footer_icon":false
        },

        {
          "type":"horizontal_list",
          "title":"Collections",
          "items":[
            {
              "type":"circular_item",
              "text":"Breakfast",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },
            {
              "type":"circular_item",
              "text":"Meat Based",
              "image":"https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1989&q=80"
            },
            {
              "type":"circular_item",
              "text":"Vegan",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },  {
              "type":"circular_item",
              "text":"Breakfast",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },
            {
              "type":"circular_item",
              "text":"Meat Based",
              "image":"https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1989&q=80"
            },
            {
              "type":"circular_item",
              "text":"Vegan",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },  {
              "type":"circular_item",
              "text":"Breakfast",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },
            {
              "type":"circular_item",
              "text":"Meat Based",
              "image":"https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1989&q=80"
            },
            {
              "type":"circular_item",
              "text":"Vegan",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },
          ]
        },
        {
          "type":"horizontal_list",
          "title":"Cuisines",
          "items":[
            {
              "type":"box_item",
              "text":"American",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },
            {
              "type":"box_item",
              "text":"Italian",
              "image":"https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg"
            },
            {
              "type":"box_item",
              "text":"Thai",
              "image":"https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
            }
          ]
        }
      ]
    }
    );

     await Future.delayed(const Duration(seconds: 5));
     Provider.of<ThemeConfig>(context, listen: false).getTheme( (apiResponse.app?.theme) == "light" );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: getBody(),

    );
  }


  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        // shrinkWrap: false,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getBannerRow(),
          const SizedBox(height: 25,),
         const Padding(
            padding:  EdgeInsets.only(top: 5,bottom: 10),
            child: const Text(" Collections",
              style: TextStyle(color: Colors.black,
                  fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          getCollectionList(),
          const SizedBox(height: 25,),
         const Text(" Cuisines",
          style: TextStyle(color: Colors.black,
          fontSize: 18, fontWeight: FontWeight.bold),),
          getCuisinesList(),
          const SizedBox(height: 25,),
          getXXX(),
          getCarouselWidget(),
        ],
      ),
    );
  }

  Widget getBannerRow(){
    List<Widgetss>? widgetsList = apiResponse.widgets?.where((element) => element.type == "banner").toList();
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widgetsList?.length??0, (index) {
            return getBannerCard(widgetsList![index]);
          }),
        ),
      ),
    );
  }

  Widget getBannerCard(Widgetss widgetss) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10,10,10,10),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        image:widgetss.image!= null && widgetss.image !="" ? DecorationImage(image: NetworkImage(widgetss.image??""),
        fit: BoxFit.fitWidth): null,

      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45,
            ),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
            child: Text(widgetss.headerText ?? "", style: const TextStyle(
              color: Colors.white,
            ),),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45,
            ),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
            child: IntrinsicWidth(
              child: Row(
                children: [
                  Text(widgetss.footerText ?? "", style: const TextStyle(
                    color: Colors.white,
                  ),),
                  widgetss.footerIcon?? false ? const Icon(Icons.arrow_right_alt, color: Colors.white,) : const SizedBox(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCollectionList(){
    List<Widgetss>? widgetsList = apiResponse.widgets?.where((element) => (element.type == "horizontal_list" && element.title=='Collections') ).toList();
    List<Items>? itemList;
    widgetsList?.forEach((element) {
      itemList = element.items?.where((element) => element.type == "circular_item").toList();
    });

    return SizedBox(
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(itemList?.length??0, (index) {
            return getCollectionCircles(itemList![index]);
          }),
        ),
      ),
    );
  }

  Widget getCollectionCircles(Items itemList){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blueAccent.shade200,
            
            backgroundImage: NetworkImage(itemList.image ??""),
          ),
        ),
        const SizedBox(height: 5,),
        Text(itemList.text??"",style: const TextStyle(color: Colors.black),),
      ],
    );
  }

  Widget getCuisinesList(){
    List<Widgetss>? widgetsList = apiResponse.widgets?.where((element) => (element.type == "horizontal_list" && element.title=='Cuisines') ).toList();
    List<Items>? itemList;
    widgetsList?.forEach((element) {
      itemList = element.items?.where((element) => element.type == "box_item").toList();
    });

    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(itemList?.length??0, (index) {
            return getCuisinesCard(itemList![index]);
          }),
        ),
      ),
    );
  }

  Widget getCuisinesCard(Items items){
    return Container(
      margin: EdgeInsets.only(right: 10,left: 5),
      height: 150,
        width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
              width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(items.image??""),fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Text(items.text ??"", style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }

  Widget getCarouselWidget(){
    // return Row(
    //   children:
    List<Widgetss>? widgetsList = apiResponse.widgets?.where((element) => element.type == "banner").toList();

    List<Widget> _listCarousel= List.generate(widgetsList?.length??0, (index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(10,10,10,10),
          height: 150,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            image:widgetsList?[index].image!= null && widgetsList?[index].image !="" ? DecorationImage(image: NetworkImage(widgetsList?[index].image??""),
                fit: BoxFit.fitWidth): null,

          ),
        );
      });
    // );

    return SizedBox(
      height: 200,
      child: CarouselWidget(itemWidgets: _listCarousel,
          itemList: apiResponse.widgets?.where((element) => element.type == "banner").toList()
      ),
    );
  }


  Widget getXXX(){
    List<Widgetss>? widgetsList = apiResponse.widgets?.where((element) => (element.type == "horizontal_list" && element.title=='Cuisines') ).toList();
    List<Items>? itemList;
    widgetsList?.forEach((element) {
      itemList = element.items?.where((element) => element.type == "box_item").toList();
    });
    itemList!.addAll(itemList!.toList());
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(itemList?.length??0, (index) {
            return Scrollable( viewportBuilder: (BuildContext kcontext, ViewportOffset position) => getXXXCard(itemList![index],kcontext));
          }),
        ),
      ),
    );
  }

  Widget getXXXCard(Items items,BuildContext _context){
    return Container(
      margin: EdgeInsets.only(right: 10,left: 5),
      height: 150,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          _buildParallaxBackground(_context,items.image??"" ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45,
            ),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
            child: Text(items.text  ?? "", style: const TextStyle(
              color: Colors.white,
            ),),
          ),
          // Text(items.text ??"", style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }

   late GlobalKey _backgroundImageKey;

  Widget _buildParallaxBackground(BuildContext context,String _image) {
    _backgroundImageKey = GlobalKey();
    return Container(
        height: 149,
        width: 109,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context)!,
          listItemContext: context,
          backgroundImageKey: _backgroundImageKey,
        ),
        children: [
          Image.network(
            _image,
            key: _backgroundImageKey,
            fit: BoxFit.cover,
          ),
        ],
      ),
    ));
  }


}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);


  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      height: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.topCenter(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
    (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final horizontalAlignment = Alignment( scrollFraction * 2 - 1,0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
    horizontalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
      Transform.translate(offset: Offset( childRect.left,0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}