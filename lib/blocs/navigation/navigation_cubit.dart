import 'package:bloc/bloc.dart';
import 'package:good_reader/blocs/navigation/navigation_enum.dart';

class NavigationCubit extends Cubit<NavigationItems> {
  NavigationCubit() : super(NavigationItems.home);

  void setNavigationItem(NavigationItems item) {
    emit(item);
  }
}
