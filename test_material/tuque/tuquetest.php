<?php
/**
 * Sample tuque script that queries the Fedora Resource Index to get a list of
 * all objects that are children of the islandora:sp_basic_image_collection.
 */

$fedora_user = 'fedoraAdmin';
$fedora_pass = 'fedoraAdmin';
$fedora_url = 'http://localhost:8080/fedora';
$collection = 'islandora:sp_basic_image_collection';

/**
 * Load Tuque API.
 */
include_once 'tuque/Datastream.php';
include_once 'tuque/FedoraApi.php';
include_once 'tuque/FedoraApiSerializer.php';
include_once 'tuque/Object.php';
include_once 'tuque/RepositoryConnection.php';
include_once 'tuque/Cache.php';
include_once 'tuque/RepositoryException.php';
include_once 'tuque/Repository.php';
include_once 'tuque/FedoraRelationships.php';

// Connect to the Fedora repo.
try {
  $connection = new RepositoryConnection($fedora_url, $fedora_user, $fedora_pass);
}
catch (Exception $e) {
  print $e->getMessage();
}

$api = new FedoraApi($connection);
$cache = new SimpleCache();
$repository = new FedoraRepository($api, $cache);

// Query the rindex to get all the objects that have a 'isMemberOfCollection'
// relationship with the specified collection.
$ri_query = 'select $object from <#ri>
  where  $object <fedora-rels-ext:isMemberOfCollection> <info:fedora/' . $collection . '>';
  $members = $repository->ri->itqlQuery($ri_query, 'unlimited');

print "Members of the '$collection' collection\n\n";

// Print out their PIDs.
foreach ($members as $member) {
  print $member['object']['value'] . "\n";
}