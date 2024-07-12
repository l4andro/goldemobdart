import "package:flutter/material.dart";
import "package:minimalstore2/services/auth_provider.dart";
import "package:provider/provider.dart";
import "../themes/theme_provider.dart";
import "../themes/themes.dart";
import "my_list_tile.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>().themeData;
    final userLogedIn = context.watch<UserProvider>().isAuthenticated;
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                DrawerHeader(
                    child: Center(
                        child: (
                  Image.network("https://firebasestorage.googleapis.com/v0/b/goldenmobshoes.appspot.com/o/LogoGoldemMob.png?alt=media&token=5029dbf6-4bc9-46f5-ad92-a61fe083369e")
                ))),
                const SizedBox(height: 25),
                MyListTile(
                  text: "Produtos",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/shop_page");
                  },
                ),
                   MyListTile(
                    text: "Camisas&Moletom",
                    icon: Icons.checkroom_sharp,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/camisas_e_moletom_page");
                    }),
                    MyListTile(
                      text: "Acessorios",
                      icon: Icons.theater_comedy_sharp,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/acessorios_page");
                      }),
                    MyListTile(
                      text: "Tenis",
                      icon: Icons.snowshoeing_sharp,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/tenis_page");
                      }),
                MyListTile(
                    text: "Carrinho",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/cart_page");
                    })
              ]),
              Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    children: [
                      MyListTile(
                            text: userLogedIn
                          ? "Sair"
                          : "Login",
                          icon: userLogedIn
                         ? Icons.logout
                         : Icons.account_circle_outlined,
                          onTap: () {
                            if (userLogedIn) {
                              Navigator.pop(context);
                              context.read<UserProvider>().signOut();
                            } else {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, "/login_page");
                            }
                          }),
                      MyListTile(
                          text: theme == lightMode
                              ? "Modo Escuro"
                              : "Modo  Claro",
                          icon: theme == lightMode
                              ? Icons.toggle_off
                              : Icons.toggle_on_outlined,
                          onTap: () {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme();
                          })
                    ],
                  ))
            ]));
  }
}
