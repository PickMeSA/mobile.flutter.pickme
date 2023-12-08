class PaginationEntity{
  final int pageSize;
  final int pageNumber;
  final int total;
  final int totalPages;
  final int? nextPage;
  final int? prevPage;
  final String? searchTerm;
  final DateTime? lastUpdated;

  PaginationEntity({
    required this.pageSize,
    required this.pageNumber,
    required this.total,
    required this.totalPages,
    this.nextPage,
    this.prevPage,
    required this.searchTerm,
    this.lastUpdated
  });
  
}