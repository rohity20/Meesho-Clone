import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen.dart/components/details_card.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          //edit profile button
          const Align(
                  alignment: Alignment.topRight,
                  // child: Icon(Icons.edit, color: whiteColor))
                  child: Icon(Icons.edit))
              .onTap(() {}),
          Row(
            children: [
              Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              10.widthBox,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Dummy User".text.fontFamily(semibold).white.make(),
                  // "customer@example.com".text.white.make(),
                  "Dummy User".text.fontFamily(semibold).make(),
                  "customer@example.com".text.make(),
                ],
              )),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                  // color: whiteColor,
                  color: Colors.pink,
                )),
                onPressed: () async {
                  await Get.put(AuthController()).signoutMethod(context);
                  Get.offAll(() => const LoginScreen());
                },
                child: logout.text.fontFamily(semibold).pink500.make(),
              )
            ],
          ),

          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsCard(
                  count: "19",
                  title: "in your cart",
                  width: context.screenWidth / 3.4),
              detailsCard(
                  count: "32",
                  title: "in your wishlist",
                  width: context.screenWidth / 3.4),
              detailsCard(
                  count: "67",
                  title: "your orders",
                  width: context.screenWidth / 3.4),
            ],
          ),

          //buttons section
          20.heightBox, //40

          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider(color: lightGrey);
            },
            itemCount: profileButtonList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.asset(
                  profileButtonIcon[index],
                  width: 22,
                ),
                title: profileButtonList[index]
                    .text
                    .fontFamily(semibold)
                    .color(darkFontGrey)
                    .make(),
              );
            },
          )
              .box
              .white
              .rounded
              .padding(const EdgeInsets.symmetric(horizontal: 16))
              .shadowSm
              .make(),
        ]),
      )),
    ));
  }
}
