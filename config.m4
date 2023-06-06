PHP_ARG_ENABLE(
  [ecma_intl],
  [for i18n support, Ecma-style (ECMA-402)],
  [AS_HELP_STRING(
    [--enable-ecma_intl],
    [Enable i18n support, Ecma-style (ECMA-402)])
  ],
  [yes]
)

if test "$PHP_ECMA_INTL" != "no"; then
  PKG_CHECK_MODULES([ICU], [icu-uc >= 67.1 icu-i18n icu-io])

  PHP_EVAL_INCLINE($ICU_CFLAGS)
  PHP_EVAL_LIBLINE($ICU_LIBS, ECMA_INTL_SHARED_LIBADD)

  PHP_SUBST(ECMA_INTL_SHARED_LIBADD)
  AC_DEFINE(HAVE_ECMA_INTL, 1, [ Have ecma_intl support ])

  ECMA_INTL_COMMON_FLAGS="$ICU_CFLAGS"

  PHP_ECMA_INTL_C_SOURCES="                                                    \
    src/php/classes/calendar.c                                                 \
    src/php/ecma_intl.c                                                        \
    "

  PHP_ECMA_INTL_CXX_SOURCES="                                                  \
    "

  PHP_NEW_EXTENSION(
    ecma_intl,
    $PHP_ECMA_INTL_C_SOURCES,
    $ext_shared,
    ,
    $ECMA_INTL_COMMON_FLAGS,
    cxx
  )

  PHP_REQUIRE_CXX()
  PHP_CXX_COMPILE_STDCXX(11, mandatory, PHP_ECMA_INTL_STDCXX)

  EXTRA_CXXFLAGS="$PHP_ECMA_INTL_STDCXX $ICU_CXXFLAGS"
  PHP_SUBST(EXTRA_CXXFLAGS)

  if test "$ext_shared" = "no"; then
    PHP_ADD_SOURCES(
      PHP_EXT_DIR(ecma_intl),
      $PHP_ECMA_INTL_CXX_SOURCES,
      $ECMA_INTL_COMMON_FLAGS
    )
  else
    PHP_ADD_SOURCES_X(
      PHP_EXT_DIR(ecma_intl),
      $PHP_ECMA_INTL_CXX_SOURCES,
      $ECMA_INTL_COMMON_FLAGS,
      shared_objects_ecma_intl,
      yes
    )
  fi

  PHP_ADD_EXTENSION_DEP(ecma_intl, spl)

  PHP_ADD_MAKEFILE_FRAGMENT
fi
