import '../domain.dart';

class CustomerDomain extends Domain<Customer> {
  @override
  Future<List<Customer>> getList(
          {int limit = 20, bool startAfterTheLastDocument = false}) =>
      repository.getList(
        (_) => Customer.fromJson(_),
        Collections.customers,
        startAfterTheLastDocument: startAfterTheLastDocument,
      );

  Future<void> put(Customer customer) async {
    customer.uuid ??= uidV1;
    return repository.put(
      data: customer.toJson(),
      collection: Collections.customers,
      uuid: customer.uuid,
    );
  }

  Future<void> delete(String uuid) => repository.delete(
        uuid: uuid,
        collection: Collections.customers,
      );
}
