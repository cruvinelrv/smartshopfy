import '../../domain/entities/entities.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required int id,
    required String title,
    required String vendor,
    required String productType,
    required String createdAt,
    required String handle,
    required String updatedAt,
    required String publishedAt,
    required String templateSuffix,
    required String status,
    required String publishedScope,
    required String tags,
    required String imageId,
  }) : super(
          id: id,
          title: title,
          vendor: vendor,
          productType: productType,
          createdAt: createdAt,
          handle: handle,
          updatedAt: updatedAt,
          publishedAt: publishedAt,
          templateSuffix: templateSuffix,
          status: status,
          publishedScope: publishedScope,
          tags: tags,
          imageId: imageId,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      vendor: json['vendor'],
      productType: json['product_type'],
      createdAt: json['created_at'],
      handle: json['handle'],
      updatedAt: json['updated_at'],
      publishedAt: json['published_at'],
      templateSuffix: json['template_suffix'],
      status: json['status'],
      publishedScope: json['published_scope'],
      tags: json['tags'],
      imageId: json['image']['src'],
    );
  }
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      vendor: map['vendor'],
      productType: map['product_type'],
      createdAt: map['created_at'],
      handle: map['handle'],
      updatedAt: map['updated_at'],
      publishedAt: map['published_at'],
      templateSuffix: map['template_suffix'] ?? '',
      status: map['status'],
      publishedScope: map['published_scope'],
      tags: map['tags'],
      imageId: map['image']['src'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'vendor': vendor,
      'product_type': productType,
      'created_at': createdAt,
      'handle': handle,
      'updated_at': updatedAt,
      'published_at': publishedAt,
      'template_suffix': templateSuffix,
      'status': status,
      'published_scope': publishedScope,
      'tags': tags,
      'image': imageId,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'vendor': vendor,
      'product_type': productType,
      'created_at': createdAt,
      'handle': handle,
      'updated_at': updatedAt,
      'published_at': publishedAt,
      'template_suffix': templateSuffix,
      'status': status,
      'published_scope': publishedScope,
      'tags': tags,
      'image': imageId,
    };
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, vendor: $vendor, productType: $productType, createdAt: $createdAt, handle: $handle, updatedAt: $updatedAt, publishedAt: $publishedAt, templateSuffix: $templateSuffix, status: $status, publishedScope: $publishedScope, tags: $tags, imageId: $imageId)';
  }
}
