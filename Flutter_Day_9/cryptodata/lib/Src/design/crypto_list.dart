import 'package:cryptodata/Src/bloc/crypto_bloc.dart';
import 'package:cryptodata/Src/model/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  State<CryptoList> createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  @override
  Widget build(BuildContext context) {
    bloc.getAllCrypto();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.indigo,
        title: const Text(
          'Top List by 24H Volume',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: StreamBuilder(
        stream: bloc.allCrypto,
        builder: (context, AsyncSnapshot<CryptoData> snapshot) {
          if (snapshot.hasData) {
            return itemList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget itemList(AsyncSnapshot<CryptoData> snapshot) {
    return AnimatedList(
      initialItemCount: snapshot.data!.data.length,
      itemBuilder: (BuildContext context, index, animation) {
        return Card(
          elevation: 4,
          child: InkWell(
            child: Column(
              children: [
                ListTile(
                  leading: Image.network(
                    'https://www.cryptocompare.com${snapshot.data!.data[index].coinInfo.imageUrl}',
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    snapshot.data!.data[index].coinInfo.fullName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    'Last Update: ${snapshot.data!.data[index].display.usd.lastupdate}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                    snapshot.data!.data[index].display.usd.price,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 72),
                  child: ListTile(
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                          'Lowest in Day: ${snapshot.data!.data[index].display.usd.lowday}'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 72),
                  child: ListTile(
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                          'Highest in Day: ${snapshot.data!.data[index].display.usd.highday}'),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.NO_HEADER,
                headerAnimationLoop: false,
                animType: AnimType.BOTTOMSLIDE,
                title:
                    'What to Buy ${snapshot.data!.data[index].coinInfo.name}',
                desc:
                    'Current Value ${snapshot.data!.data[index].display.usd.price}',
                buttonsTextStyle: const TextStyle(color: Colors.black),
                showCloseIcon: true,
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          headerAnimationLoop: false,
                          title:
                              'Thanks For Purchasing ${snapshot.data!.data[index].coinInfo.name}',
                          desc: 'Have a Nice Day',
                          showCloseIcon: true)
                      .show();
                },
              ).show();
            },
          ),
        );
      },
    );
  }
}




// Text(snapshot.data!.data[index].coinInfo.fullName)
//https://min-api.cryptocompare.com/data/top/totalvolfull?limit=1&tsym=USD&api_key=c73f7c0fd4b81ad17f3b63cafbc9626b1e4040c5995c525570eeb6046f193c56

///media/37746407/student.png

//https://min-api.cryptocompare.com//media/37746407/student.png