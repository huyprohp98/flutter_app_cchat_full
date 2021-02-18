import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'news_product.g.dart';

@JsonSerializable()
class NewsProduct extends Equatable {
  int id;
  String title;
  String description;
  String content;
  int type;
  @JsonKey(name: "video_link")
  String videoLink;
  String image;
  @JsonKey(name: "percent_off")
  int percentOff;
  @JsonKey(name: "is_use_with_voucher")
  int isUseWithVoucher;
  @JsonKey(name: "invoice_total")
  int invoiceTotal;
  @JsonKey(name: "max_sale")
  int maxSale;
  @JsonKey(name: "start_date")
  String startDate;
  @JsonKey(name: "end_date")
  String endDate;
  @JsonKey(name: "created_at")
  String createdAt;

  NewsProduct(
      this.id,
      this.title,
      this.description,
      this.content,
      this.type,
      this.videoLink,
      this.image,
      this.percentOff,
      this.isUseWithVoucher,
      this.invoiceTotal,
      this.maxSale,
      this.startDate,
      this.endDate,
      this.createdAt);

  factory NewsProduct.fromJson(Map<String, dynamic> json) => _$NewsProductFromJson(json);

  Map<String, dynamic> toJson() => _$NewsProductToJson(this);

  @override
  List<Object> get props => [
        id,
        title,
        description,
        content,
        type,
        videoLink,
        image,
        percentOff,
        isUseWithVoucher,
        invoiceTotal,
        maxSale,
        startDate,
        endDate,
        createdAt
      ];

  @override
  String toString() {
    return 'NewsProduct{id: $id, title: $title, description: $description, content: $content, type: $type, videoLink: $videoLink, image: $image, percentOff: $percentOff, isUseWithVoucher: $isUseWithVoucher, invoiceTotal: $invoiceTotal, maxSale: $maxSale, startDate: $startDate, endDate: $endDate, createdAt: $createdAt}';
  }
}
