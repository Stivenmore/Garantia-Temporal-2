//Asi seria la implementacion de Unit Testing

/*
void main() {
  blocTest('setdata false',
      build: () => FirebaseCubit(),
      act: (FirebaseCubit cubit) async {
        await cubit.setData(name: '', lastname: '', date: '', direction: []);
      },
      expect: () => [isA<FirebaseInitial>(), isA<FirebaseError>()]);

  blocTest('setdata true',
      build: () => FirebaseCubit(),
      act: (FirebaseCubit cubit) async {
        await cubit.setData(
            name: 'Noah',
            lastname: 'Morelo',
            date: 'May 6 2000',
            direction: ['cra 19', 'no se que mas']);
      },
      expect: () => [isA<FirebaseInitial>(), isA<FirebaseSnapbar>()]);
  blocTest('getData true',
      build: () => FirebaseCubit(),
      act: (FirebaseCubit cubit) async {
        await cubit.getDate();
      },
      expect: () => [isA<FirebaseInitial>(), isA<FirebaseLoaded>()]);
}
*/