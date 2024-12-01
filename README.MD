### Rowan Component Activation Query

An extension on the GsQuery subsystem that allows for the creation of queries like the following:
```
3.6.1 < each.gemstoneVersion <= 3.7.0

(3.6.1 < each.gemstoneVersion <= 3.7.0) & (tests = true) | (ci = true))
```
where the numeric-ish literals (like `3.7.0`) are interpretted as instances of RwGemStoneVersionNumber.  The variables ('tests' and 'ci') represent attrbute values ... if the attribute is present, it's value is `true`, otherwise it's value is `false'.

These expressions are used in Rowan conditional components to determine whether the packages associated with the component should be loaded or not...

### Install script for Rowan Component Activation Query project (RwCAQ)
```
projectsHome=/bosch1/users/dhenrich/_stones/git
installProject.stone file:${projectsHome}/RwCAQ/rowan/specs/RwCAQ.ston --projectsHome=${projectsHome} -D
```

