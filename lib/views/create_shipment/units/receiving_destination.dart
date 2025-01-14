part of '../view.dart';

class _ReceiverPage extends StatelessWidget {
  const _ReceiverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final inputs = cubit.inputs.receiver;
    return ListView.separated(
      padding: EdgeInsets.only(top: 20),
      itemCount: inputs.length,
      itemBuilder: (context, index) {
        return _Input(input: inputs[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}
