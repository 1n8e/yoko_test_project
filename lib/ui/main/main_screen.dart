import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test_project/bloc/active/active_bloc.dart';
import 'package:yoko_test_project/const/text_styles.dart';
import 'package:yoko_test_project/core/injections.dart';
import 'package:yoko_test_project/ui/active/detailed_active_screen.dart';
import 'package:yoko_test_project/ui/main/active_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActiveBloc>(
      create: (_) => getIt<ActiveBloc>()..add(GetActiveEvent()),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Активности',
            style: ConstTextStyles.mainText,
          ),
          elevation: 0,
          backgroundColor: const Color(0xffFFFFFF),
        ),
        body: BlocBuilder<ActiveBloc, ActiveState>(
          builder: (context, state) {
            if (state is SuccessLoadedState) {
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                separatorBuilder: (context, state) =>
                    const SizedBox(height: 16),
                itemCount: state.actives.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailedActiveScreen(
                            image: state.actives[index].image,
                            name: state.actives[index].activeName,
                            tariffs: state.actives[index].tariffs,
                            dates: state.actives[index].dates,
                          ),
                        ),
                      );
                    },
                    child: ActiveCard(
                      title: state.actives[index].activeName,
                      image: state.actives[index].image,
                    ),
                  );
                },
              );
            }
            if (state is FailureLoadedState) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is LoadingActiveState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ActiveInitial) {
              return const Center(
                child: Text('init'),
              );
            } else {
              return Offstage();
            }
          },
        ),
      ),
    );
  }
}
