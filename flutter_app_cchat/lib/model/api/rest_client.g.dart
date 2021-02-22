// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://app.cchatclothes.vn';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<LoginRegisterResponse> loginApp(loginAppRequest) async {
    ArgumentError.checkNotNull(loginAppRequest, 'loginAppRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginAppRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/api/loginApp',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginRegisterResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<RegisterResponse> registerApp(registerAppRequest) async {
    ArgumentError.checkNotNull(registerAppRequest, 'registerAppRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerAppRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/api/registerApp',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<RegisterVerifyResponse> registerVerify(registerVerifyRequest) async {
    ArgumentError.checkNotNull(registerVerifyRequest, 'registerVerifyRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerVerifyRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/checkOtpRegister',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterVerifyResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ResendOtpResponse> resendOtp(resendOtpRequest) async {
    ArgumentError.checkNotNull(resendOtpRequest, 'resendOtpRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(resendOtpRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/resendCodeOtp',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ResendOtpResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(forgotPasswordRequest) async {
    ArgumentError.checkNotNull(forgotPasswordRequest, 'forgotPasswordRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(forgotPasswordRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/forgetPassword',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ForgotPasswordResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ForgotPasswordVerifyResponse> forgotPasswordVerify(
      forgotPasswordVerifyRequest) async {
    ArgumentError.checkNotNull(
        forgotPasswordVerifyRequest, 'forgotPasswordVerifyRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(forgotPasswordVerifyRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/checkOtpInForgotPassword',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ForgotPasswordVerifyResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ForgotPasswordResetResponse> forgotPasswordReset(
      forgotPasswordResetRequest) async {
    ArgumentError.checkNotNull(
        forgotPasswordResetRequest, 'forgotPasswordResetRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(forgotPasswordResetRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/resetPassword',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ForgotPasswordResetResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<HomePageResponse> getHomePage() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/getInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HomePageResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsResponse> getNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/listUserNew',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListVoucherResponse> getListVouchers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/listVoucher',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListVoucherResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListBannerResponse> getListBanners() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/getInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListBannerResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCategoryProductResponse> getListCategoryProducts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/getInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCategoryProductResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListSizeResponse> getListSizes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/getInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListSizeResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<CategoryProductHotResponse> getListCategoryProductHots(
      limit, offset, sort) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    ArgumentError.checkNotNull(sort, 'sort');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset,
      r'sort': sort
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/listProducts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CategoryProductHotResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<HomeResponse> getHomeData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/getInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HomeResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<CategoryProductBestNewResponse> getListCategoryProductNewBests(
      limit, offset, sort) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    ArgumentError.checkNotNull(sort, 'sort');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset,
      r'sort': sort
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/listProducts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CategoryProductBestNewResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsProductResponse> getNewProducts(
      limit, offset, type, searchWord) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(searchWord, 'searchWord');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset,
      r'type': type,
      r'search_word': searchWord
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/news',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsProductResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DetailNewResponse> getDetailNews(newId) async {
    ArgumentError.checkNotNull(newId, 'newId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'news_id': newId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/newsDetail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DetailNewResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<DetailProductResponse> getDetailProducts(productId) async {
    ArgumentError.checkNotNull(productId, 'productId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'product_id': productId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/getDetailProduct',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DetailProductResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<AddProductInCartResponse> cartAdds(
      productId, colorId, sizeId, quantity) async {
    ArgumentError.checkNotNull(productId, 'productId');
    ArgumentError.checkNotNull(colorId, 'colorId');
    ArgumentError.checkNotNull(sizeId, 'sizeId');
    ArgumentError.checkNotNull(quantity, 'quantity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'product_id': productId,
      r'color_id': colorId,
      r'size_id': sizeId,
      r'quantity': quantity
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/addProductInCart',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AddProductInCartResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ProductByAttrResponse> getProductByAttrs(limit, offset, categoryId,
      sizeId, colorId, priceBegin, priceEnd, type) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    ArgumentError.checkNotNull(categoryId, 'categoryId');
    ArgumentError.checkNotNull(sizeId, 'sizeId');
    ArgumentError.checkNotNull(colorId, 'colorId');
    ArgumentError.checkNotNull(priceBegin, 'priceBegin');
    ArgumentError.checkNotNull(priceEnd, 'priceEnd');
    ArgumentError.checkNotNull(type, 'type');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset,
      r'category_id': categoryId,
      r'size_id': sizeId,
      r'color_id': colorId,
      r'price_begin': priceBegin,
      r'price_end': priceEnd,
      r'type': type
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/searchProductByKey',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ProductByAttrResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ProfileResponse> getProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/api/profileUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ProfileResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<AppConfigResponse> getAppConfigs() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/getInfoAppConfig',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AppConfigResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdateAvatarResponse> updateAvatar(avatarFile) async {
    ArgumentError.checkNotNull(avatarFile, 'avatarFile');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'avatar_image',
        MultipartFile.fromFileSync(avatarFile.path,
            filename: avatarFile.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/updateAvatarUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdateAvatarResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdateBackgroundImageResponse> updateBackgroundImage(
      backgroundImageFile) async {
    ArgumentError.checkNotNull(backgroundImageFile, 'backgroundImageFile');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'background_image',
        MultipartFile.fromFileSync(backgroundImageFile.path,
            filename:
                backgroundImageFile.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/updateBackgroundImageUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdateBackgroundImageResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdateBirthdayResponse> updateBirthday(updateBirthdayRequest) async {
    ArgumentError.checkNotNull(updateBirthdayRequest, 'updateBirthdayRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateBirthdayRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/updateBirthdayUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdateBirthdayResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdateEmailResponse> updateEmailVerify(
      updateEmailVerifyRequest) async {
    ArgumentError.checkNotNull(
        updateEmailVerifyRequest, 'updateEmailVerifyRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateEmailVerifyRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/sendOtpInUpdateEmailUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdateEmailResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdateEmailResponse> updateEmail(updateEmailRequest) async {
    ArgumentError.checkNotNull(updateEmailRequest, 'updateEmailRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateEmailRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/updateEmailUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdateEmailResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdatePhoneResponse> updatePhone(updatePhoneRequest) async {
    ArgumentError.checkNotNull(updatePhoneRequest, 'updatePhoneRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updatePhoneRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/updatePhoneNumberUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdatePhoneResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdatePhoneResponse> updatePhoneVerify(
      updatePhoneVerifyRequest) async {
    ArgumentError.checkNotNull(
        updatePhoneVerifyRequest, 'updatePhoneVerifyRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updatePhoneVerifyRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/sendOtpInUpdatePhoneUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdatePhoneResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<UpdateNameResponse> updateName(updateNameRequest) async {
    ArgumentError.checkNotNull(updateNameRequest, 'updateNameRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateNameRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/api/updateFullNameUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdateNameResponse.fromJson(_result.data);
    return value;
  }
}
