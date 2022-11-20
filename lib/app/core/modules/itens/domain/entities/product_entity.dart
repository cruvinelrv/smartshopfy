class ProductEntity {
  final int id;
  final String title;
  final String vendor;
  final String productType;
  final String createdAt;
  final String handle;
  final String updatedAt;
  final String publishedAt;
  final String templateSuffix;
  final String status;
  final String publishedScope;
  final String tags;
  final String imageId;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.vendor,
    required this.productType,
    required this.createdAt,
    required this.handle,
    required this.updatedAt,
    required this.publishedAt,
    required this.templateSuffix,
    required this.status,
    required this.publishedScope,
    required this.tags,
    required this.imageId,
  });
}
