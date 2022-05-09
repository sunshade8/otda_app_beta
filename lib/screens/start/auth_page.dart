import 'package:app_v2/constants/common_size.dart';
import 'package:app_v2/states/user_provider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:app_v2/constants/common_size.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final inputBorder = OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),);

  TextEditingController _phoneNumberController = TextEditingController(text: "010");

  TextEditingController _verifiNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  double getVerificationHeight(VerificationStatus status){
    switch(status){
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 48;
    }
  }

  @override
  void dispose(){
    _phoneNumberController.dispose();
    _verifiNumberController.dispose();
  }
  //인증하기 버튼 클릭시 인증중 처리함수
  void attemptVerify() async {
    //인증처리 중인 상태관리
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });
    //퓨처함수로 인증 딜레이 시간 묘사
    await Future.delayed(Duration(seconds: 3));
    //인증처리 완료 상태관리
    context.read<UserProvider>().SetUserAuth(true);

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){

        Size size = MediaQuery.of(context).size;

        return IgnorePointer(
          ignoring: _verificationStatus == VerificationStatus.verifying,
          child: Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                title: Text('로그인 하기', style: Theme.of(context).textTheme.headline6,),
                elevation: AppBarTheme.of(context).elevation,

              ),
              body: GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(common_bg_padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        ExtendedImage.asset(
                          'assets/images/secure.png',
                          width: size.width * 0.25,
                          height: size.width * 0.25,
                        ),
                        SizedBox(width: common_sm_padding,),
                        Text('로그인화면 설명글',style: Theme.of(context).textTheme.subtitle1,),

                      ],
                      ),
                      SizedBox(width: common_bg_padding,),
                      TextFormField(
                        validator: (phoneNumber){
                          if(phoneNumber != null && phoneNumber.length == 13) {
                            return null;
                          } else{
                            return '올바른 전화번호를 입력하세요' ;
                          }
                        },
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [MaskedInputFormatter("000 0000 0000")],
                        decoration: InputDecoration(
                          border: inputBorder,
                          focusedBorder: inputBorder,
                        ),
                      ),
                      SizedBox(height: common_sm_padding,),
                      TextButton(
                        onPressed: () {
                          if(_formKey.currentState!=null){
                            bool passed = _formKey.currentState!.validate();

                            if(passed)
                              setState(() {
                                _verificationStatus = VerificationStatus.codeSent;

                              });
                          }
                        },
                        child: Text(' 인증문자 발송 '),

                      ),
                      SizedBox(width: common_bg_padding,),
                      AnimatedOpacity(
                          opacity: (_verificationStatus == VerificationStatus.none)
                            ?0
                            :1,
                          duration: Duration(milliseconds: 300),

                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: getVerificationHeight(_verificationStatus),
                        child: TextFormField(
                          controller: _verifiNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [MaskedInputFormatter("000000")],
                          decoration: InputDecoration(
                            border: inputBorder,
                            focusedBorder: inputBorder,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: getVerificationHeight(_verificationStatus),
                        child: TextButton(
                          onPressed: () {
                            attemptVerify();
                          },

                          child: (_verificationStatus == VerificationStatus.verifying)
                            ?CircularProgressIndicator(color: Colors.white,)
                            :Text(' 인증하기 '),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ),
        );}

    );
  }
}

enum VerificationStatus {
  none, codeSent, verifying, verificationDone
}