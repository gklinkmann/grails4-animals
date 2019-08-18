# grails4-animals
grails 4 example with bootstrap 4 (adminLTE template), spring-security, image gallery and upload

**Grails4Animals** is a [grails 4](https://grails.org/) example with bootstrap 4 ([adminLTE](https://github.com/ColorlibHQ/AdminLTE/tree/v3-dev) template), spring-security, image gallery ([fancybox](https://fancyapps.com/fancybox/3/)) and upload. It provides an user administration, an image processing and a german localisation.

## Screenshots
see [wiki](https://github.com/gklinkmann/grails4-animals/wiki)

## Installation
```bash
git clone https://github.com/gklinkmann/grails4-animals.wiki.git
```

## Configuration
You have to configure the webserver url and the image path in the [application.yml](https://github.com/gklinkmann/grails4-animals/blob/master/grails-app/conf/application.yml) config file. Esp. `http://localhost/~gklinkmann/grails4-animals`.

```yml
        apache:
            serverURL: 'http://localhost/~username/${info.app.name}'
        de:
            koo:
                animals:
                    images:
                        path: '/Users/username/public_html/${info.app.name}/images/animals'
                        url: '${apache.serverURL}/images/animals'

