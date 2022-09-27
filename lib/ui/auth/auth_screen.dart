import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test_project/bloc/auth/auth_cubit.dart';
import 'package:yoko_test_project/const/colors.dart';
import 'package:yoko_test_project/const/text_styles.dart';
import 'package:yoko_test_project/ui/main/main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isObscure = true;

  bool get validator => email.text.isNotEmpty && password.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessAuth) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MainScreen()));
        }
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.maxFinite,
          decoration:
              const BoxDecoration(gradient: ConstColors.bgLinearGradien),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Добро\nпожаловать,\nАвторизуйтесь',
                style: ConstTextStyles.mainTitle.copyWith(height: 1.2),
              ),
              const SizedBox(height: 24),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 12),
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ConstColors.fieldBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: email,
                  style: ConstTextStyles.cardSubtitle,
                  onChanged: (String value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'E-mail',
                    hintStyle: ConstTextStyles.formHint,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                alignment: Alignment.center,
                height: 48,
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ConstColors.fieldBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  obscureText: isObscure,
                  controller: password,
                  style: ConstTextStyles.cardSubtitle,
                  onChanged: (String value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: const Icon(
                        Icons.visibility,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: 'Пароль',
                    hintStyle: ConstTextStyles.formHint,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        validator
                            ? ConstColors.buttonColor
                            : const Color(0xffFFFFFF).withOpacity(.08),
                      ),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.maxFinite, 48))),
                  onPressed: validator
                      ? () {
                          context
                              .read<AuthCubit>()
                              .logIn(email.text, password.text);
                        }
                      : null,
                  child: Text(
                    'Войти',
                    style: validator
                        ? ConstTextStyles.cardSubtitle.copyWith(
                            color: const Color(0xff4271B5),
                          )
                        : ConstTextStyles.formHint,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Регистрация',
                        style:
                            ConstTextStyles.cardSubtitle.copyWith(fontSize: 14),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text('Забыли пароль?',
                          style:
                              ConstTextStyles.formHint.copyWith(fontSize: 14))),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Или войдите через:',
                  style: ConstTextStyles.cardSubtitle.copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: ConstColors.buttonColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'G',
                          style:
                              ConstTextStyles.mainTitle.copyWith(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: ConstColors.buttonColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'f',
                          style:
                              ConstTextStyles.mainTitle.copyWith(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
