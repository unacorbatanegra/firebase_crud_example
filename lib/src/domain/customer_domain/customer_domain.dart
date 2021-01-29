import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain.dart';

class CustomerDomain extends Domain<Customer> {
  DocumentSnapshot lastDocument;
  int lastLength;

  Future<List<Customer>> getListaQuery({
    int limit = 20,
    bool startAfterTheLastDocument = false,
    String name,
  }) async {
    var lista = <Customer>[];
    if (lastLength != null && lastLength % limit != 0) return lista;
    final collection = repository.getFromCollection(Collections.customers);
    var ref = collection.limit(limit);
    if (name != null && name.isNotEmpty) {
      name = name.toLowerCase();
      ref = ref
          .where(
            'searchName',
            isGreaterThanOrEqualTo: name,
          )
          .where(
            'searchName',
            // ignore: prefer_interpolation_to_compose_strings
            isLessThanOrEqualTo: name + '\uf8ff',
          );
    }

    final documents = startAfterTheLastDocument && lastDocument != null
        ? await ref.startAfterDocument(lastDocument).get()
        : await ref.get();
    if (documents.docs.isNotEmpty) {
      lastDocument = documents.docs.last;
      lastLength = documents.docs.length;
      lista = repository.getFromDocuments(
        (_) => Customer.fromJson(_),
        documents.docs,
      );
    }
    print(documents.docs.length);
    return lista;
  }

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

  @override
  void clearPagination() {
    lastDocument = null;
    lastLength = null;
    super.clearPagination();
  }
}
