# DrupalCamp generic project

## About

This project is built using [event platform](https://www.drupal.org/project/event_platform) as the foundation of the site.

## Set up

Fork or clone this project to your local folder:
```
git clone https://github.com/fjgarlin/DrupalCampGeneric.git
cd DrupalCampGeneric
rm -rf .git
```

Quick setup: `./scripts/launch.sh`

Step by step setup:
```
ddev start
ddev composer i
ddev drush site:install -y
ddev drush -y en event_platform_olivero navigation
ddev drush theme:install olivero_sub_theme
ddev exec web/themes/custom/olivero_sub_theme/scripts/build.sh
ddev drush cr
ddev drush -y cex
ddev launch $(ddev drush uli)
```

Next fill-up the event details:
```
ddev launch admin/event-details
```

Then create a basic page for extra homepage information, and tick "Promoted to front page":
```
ddev launch node/add/page
```

## Theme
A sub-theme of Olivero was created following [olivero_sub_theme](https://github.com/mogtofu33/olivero_sub_theme) and copying it to `web/themes/custom`.

Adapt `css/theme.css` and `js/theme.js`.

Build the css with postcss by running each time:
```
ddev exec web/themes/custom/olivero_sub_theme/scripts/build.sh
```

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

### Add the rest
Then add any further customisations.
