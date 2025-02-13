#!/bin/bash

# Start all the things and drop any existing database.
ddev start
ddev composer i
ddev drush -y sql:drop
# Base install
ddev drush site:install -y
ddev drush -y en event_platform_olivero navigation
# Our subtheme.
ddev drush -y theme:install olivero_sub_theme
ddev exec web/themes/custom/olivero_sub_theme/scripts/build.sh
# Clear caches and export the current configuration to `config`
ddev drush cr
ddev drush -y cex
# Log in
ddev launch $(ddev drush uli)
# Fill up event details in this page.
ddev launch admin/event-details
# Create a basic page for extra event homepage information
# and tick "Promoted to front page":
ddev launch node/add/page
