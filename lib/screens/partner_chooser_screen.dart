import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/components/partner_card.dart';
import 'package:online_banking_app_ui/model/partner.dart';
import 'package:online_banking_app_ui/provider/partner_provider.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';
import 'package:provider/provider.dart';

class PartnerChooserScreen extends StatelessWidget {
  static const String routeName = '/partner-chooser-screen';
  const PartnerChooserScreen({Key? key}) : super(key: key);

  void _navigateToHome(final BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final PartnerProvider _partnerProvider = Provider.of<PartnerProvider>(context, listen: false);
    final List<Partner> _partnerList = _partnerProvider.partnerList;

    final String _bankCardId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose recipient',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    IconButton(
                        onPressed: () => _navigateToHome(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: ColorConstants.black,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => PartnerCard(
                          partner: _partnerList[index],
                          bankCardId: _bankCardId,
                          navigation: true,
                        ),
                    itemCount: _partnerList.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
