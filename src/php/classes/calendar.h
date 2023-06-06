/*
   +----------------------------------------------------------------------+
   | ecma_intl extension for PHP                                          |
   +----------------------------------------------------------------------+
   | Copyright (c) Ben Ramsey <ben@benramsey.com>                         |
   | This source file is subject to the MIT license that is bundled with  |
   | this package in the file LICENSE, and is available at the following  |
   | web address: https://opensource.org/license/mit/                     |
   +----------------------------------------------------------------------+
*/

#ifndef ECMA_INTL_PHP_CLASSES_CALENDAR_H
#define ECMA_INTL_PHP_CLASSES_CALENDAR_H

#include "src/php/php_common.h"

extern zend_class_entry *ecmaIntlCalendarEnum;

void registerEcmaIntlCalendarEnum(void);

#endif /* ECMA_INTL_PHP_CLASSES_CALENDAR_H */
