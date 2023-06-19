--TEST--
Intl::supportedValuesOf(collation) is sorted and unique
--EXTENSIONS--
ecma_intl
--FILE--
<?php
use Ecma\Intl;
use Ecma\Intl\Category;
use Ecma\Intl\Collation;

$values = Intl::supportedValuesOf(Category::Collation);
$uniqueSortedValues = [];

echo json_encode($values) . "\n";

$uniqueSortedValues = array_unique($values);
sort($uniqueSortedValues);

if ($uniqueSortedValues !== $values) {
    echo "Expected collation values to be sorted and have unique values.\n";
}

--EXPECTF--
[%s]
