# DrupalCamp generic project

## About

This project is built using [event platform](https://www.drupal.org/project/event_platform) as the foundation of the site.

## Set up

Fork or clone this project:
```
ddev start
ddev composer i
ddev drush site:install -y
ddev drush -y en event_platform_olivero
ddev launch
ddev drush uli
```

Then create a basic page for extra homepage information, and tick "Promoted to front page":
`ddev launch node/add/page`

## How this project was created

In order to create this repo, the following steps were followed:


### Base Drupal site
```
mkdir drupalcamp-site && cd drupalcamp-site
ddev config --project-type=drupal --docroot=web
ddev start
ddev composer create drupal/recommended-project:^10.4
ddev composer require drush/drush
ddev drush site:install -y
ddev launch
```

### Add event platform
```
ddev composer require drupal/event_platform
ddev drush -y en event_platform_olivero
```
