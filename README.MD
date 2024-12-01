### Rowan Component Activation Query

Create a variant of the GsQuery subsystem that allows for the creation of queries like the following:
```
3.6.1 < each.gemstoneVersion <= 3.7.0

(3.6.1 < each.gemstoneVersion <= 3.7.0) & (each.attribute = 'tests')
```
where the numeric-ish literals (like `3.7.0`) are interpretted as instance of RwGemStoneVersionNumber.

We cannot execute "foreign" Smalltalk code during the load process, so the plan is to create a variant of the GsQuery grammar that can be safely executed.

### Install script for Rowan Component Activation Query project (RwCAQ)
```
projectsHome=/bosch1/users/dhenrich/_stones/git
installProject.stone file:${projectsHome}/RwCAQ/rowan/specs/RwCAQ.ston --projectsHome=${projectsHome} -D
```

