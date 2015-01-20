Features / Requirements

Header:
  exists: Boolean
  width: 100%
  height: px
  line-height: px
  fixed: Boolean
  if fixed
    below(size):
      height: px
      line-height: px

Footer:
  exists: Boolean
  width: 100%
  height: px
  fixed: Boolean

Article
  width:
    if aside
      100% - aside-width
    else
      100%

Aside
  exists: Boolean
  left: Boolean (if false: right)
  width: px
  below(size):
    transform: translateX(-aside-width)

Permutations
  Header
  Header-Fixed
  Header, Footer
  Header-Fixed, Footer
  Header, Footer-Fixed
  Header-Fixed, Footer-Fixed
  Footer
  Footer-Fixed

  Article
  Article, Aside
