// import 'package:mvvm_first_c/data/network/app_api.dart';
// import 'package:mvvm_first_c/data/request/request.dart';
// import 'package:mvvm_first_c/data/responses/responses.dart';

// abstract class RemotDataSource {
//   Future<AuthenticationRespons> login(LoginRequest loginRequest);
//   Future<ForgotPasswordResponse> forgotPassword(String email);
//   Future<HomeResponse> getHome();
//   Future<StoreDetailsResponse> getStoreDetails();
//   Future<AuthenticationRespons> register(RegisterRequest registerRequest);
// }

// class RemotDataSourceImpilenter implements RemotDataSource {
//   AppServiceClient _appServiceClient;
//   RemotDataSourceImpilenter(this._appServiceClient);
//   @override
//   Future<AuthenticationRespons> login(LoginRequest loginRequest) async {
//     return await _appServiceClient.login(
//         loginRequest.email, loginRequest.password, "", "");
//   }

//   @override
//   Future<ForgotPasswordResponse> forgotPassword(String email) async {
//     return await _appServiceClient.forgotPassword(email);
//   }

//   @override
//   Future<HomeResponse> getHome() async {
//     return await _appServiceClient.getHome();
//   }

//   @override
//   Future<AuthenticationRespons> register(
//       RegisterRequest registerRequest) async {
//     return await _appServiceClient.register(
//       registerRequest.countryMobileCode,
//       registerRequest.userName,
//       registerRequest.email,
//       registerRequest.password,
//       registerRequest.mobile_number,
//       registerRequest.profilePicture,
//     );
//   }

//   @override
//   Future<StoreDetailsResponse> getStoreDetails() async {
//     return await _appServiceClient.getStoreDetails();
//   }
// }
