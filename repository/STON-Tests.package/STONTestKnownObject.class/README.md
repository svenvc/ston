I am STONTestKnownObject.

I have an id and a description.

When I am serialized, only my id is written out.

  STONTestKnownObject['bb71b026-180c-0d00-b40c-38700aee7555']

When I am materialized, the id is used to reconstruct the object, either by retrieving it from a collection of known objects, or it is created (it could also be a retrieval from somewhere else).

I keep a collection of all my known instances, new instances are added to it automatically.

Use my class side's #fromId: to access existing instances