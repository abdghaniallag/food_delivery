// import 'dart:developer';

// import 'package:mvvm_first_c/data/data_source/local_data_source.dart';
// import 'package:mvvm_first_c/data/data_source/remot_data_source.dart';
// import 'package:mvvm_first_c/data/mapper/mapper.dart';
// import 'package:mvvm_first_c/data/network/error_handler.dart';
// import 'package:mvvm_first_c/data/network/network_info.dart';
// import 'package:mvvm_first_c/domain/model.dart';
// import 'package:mvvm_first_c/data/request/request.dart';
// import 'package:mvvm_first_c/data/network/failure.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mvvm_first_c/domain/repository.dart';

// class RepositoryImpl extends Repository {
//   RemotDataSource _remoteDataSource;
//   LocalDataSource _localDataSource;
//   NetworkInfo _networkInfo;
//   RepositoryImpl(
//       this._remoteDataSource, this._networkInfo, this._localDataSource);
//   @override
//   Future<Either<Failure, Authentication>> login(
//       //its safe to call the API
//       LoginRequest loginRequest) async {
//     if (await _networkInfo.isConnected) {
//       try {
//         final response = await _remoteDataSource.login(loginRequest);
//         if (response.status == ApiInternalStatus.SUCCESS) {
//           // return data

//           log("return data ");
//           return Right(response.toDomain());
//         } else {
//           //return left logic biz error

//           log("return left logic biz error");
//           return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
//               response.message ?? ResponseMessage.DEFAULT));
//         }
//       } catch (error) {
//         return Left(ErrorHandler.handle(error).failure);
//       }
//     } else {
//       // return connection error
//       return Left((DataSource.NO_INTERNET_CONNECTION.getFailure()));
//     }
//   }

//   @override
//   Future<Either<Failure, String>> forgotPassword(String email) async {
//     if (await _networkInfo.isConnected) {
//       try {
//         // its safe to call API
//         final response = await _remoteDataSource.forgotPassword(email);

//         if (response.status == ApiInternalStatus.SUCCESS) {
//           // success
//           // return right
//           return Right(response.toDomain());
//         } else {
//           // failure
//           // return left
//           return Left(Failure(response.status ?? ResponseCode.DEFAULT,
//               response.message ?? ResponseMessage.DEFAULT));
//         }
//       } catch (error) {
//         return Left(ErrorHandler.handle(error).failure);
//       }
//     } else {
//       // return network connection error
//       // return left
//       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, Authentication>> register(
//       RegisterRequest registerRequest) async {
//     if (await _networkInfo.isConnected) {
//       try {
//         final response = await _remoteDataSource.register(registerRequest);
//         if (response.status == ApiInternalStatus.SUCCESS) {
//           // return data

//           log("return data ");
//           return Right(response.toDomain());
//         } else {
//           //return left logic biz error

//           log("return left logic biz error");
//           return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
//               response.message ?? ResponseMessage.DEFAULT));
//         }
//       } catch (error) {
//         return Left(ErrorHandler.handle(error).failure);
//       }
//     } else {
//       // return connection error
//       return Left((DataSource.NO_INTERNET_CONNECTION.getFailure()));
//     }
//   }

//   @override
//   Future<Either<Failure, HomeObject>> getHome() async {
//     try {
//       // get data from cache
//       final response = await _localDataSource.getHomeData();

//       return Right(response.toDomain());
//     } catch (e) {
//       if (await _networkInfo.isConnected) {
//         try {
//           // its safe to call the API
//           final response = await _remoteDataSource.getHome();

//           if (response.status == ApiInternalStatus.SUCCESS) // success
//           {
//             // return data (success)
//             // return right
//             // save data to cache
//             _localDataSource.saveHomeData(response);
//             return Right(response.toDomain());
//           } else {
//             // return biz logic error
//             // return left
//             return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
//                 response.message ?? ResponseMessage.DEFAULT));
//           }
//         } catch (error) {
//           return (Left(ErrorHandler.handle(error).failure));
//         }
//       } else {
//         // return connection error
//         return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
//       }
//     }
//   }

//   @override
//   Future<Either<Failure, StoreDetail>> getStoreDetail() async {
//     try {
//       // get data from cache
//       final response = await _localDataSource.getStoredetail();

//       return Right(response.toDomain());
//     } catch (e) {
//       if (await _networkInfo.isConnected) {
//         try {
//           // its safe to call the API
//           final response = await _remoteDataSource.getStoreDetails();

//           if (response.status == ApiInternalStatus.SUCCESS) // success
//           {
//             // return data (success)
//             // return right
//             // save data to cache
//             _localDataSource.saveStoreDetailData(response);
//             return Right(response.toDomain());
//           } else {
//             // return biz logic error
//             // return left
//             return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
//                 response.message ?? ResponseMessage.DEFAULT));
//           }
//         } catch (error) {
//           return (Left(ErrorHandler.handle(error).failure));
//         }
//       } else {
//         // return connection error
//         return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
//       }
//     }
//   }
// }
