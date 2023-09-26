// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:stepmoney/views/home/home_view.dart';

class HomeSummaryCard extends StatelessWidget {
  const HomeSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Container(
            height: 160.0,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: containerBlue,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Today Balance',
                    style: TextStyle(color: onContainerBlue)),
                Text((state.daily?.balance ?? 0).formatted,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    )),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // if ((state.daily?.income ?? 0) != 0)
                    Text(
                      'Income: ${(state.daily?.income ?? 0).formatted} ฿',
                      style: TextStyle(color: Colors.green),
                    ),
                    // if ((state.daily?.expense ?? 0) != 0)
                    Text(
                      'Expense: ${(state.daily?.expense ?? 0).formatted} ฿',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
