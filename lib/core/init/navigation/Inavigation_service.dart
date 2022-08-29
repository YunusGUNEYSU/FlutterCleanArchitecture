abstract class INavigationService {
  Future<void> navigaToPage({String? path,Object? data});
  Future<void> navigaToPageClear({String? path,Object? data});
  

}