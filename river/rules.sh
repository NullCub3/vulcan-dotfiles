#!/usr/bin/env bash
# *** Window Rules ***

# # Make all views with an app-id that starts with "float" and title "foo" start floating.
# riverctl rule-add -app-id 'float*' -title 'foo' float

# Make all views with app-id "bar" and any title use client-side decorations
riverctl rule-add -app-id "bar" csd

# Server Side Decorations for all
riverctl rule-add ssd

# Flameshot fix Maybe
# riverctl float-filter-add app-id 'flameshot'
riverctl rule-add -app-id 'flameshot' float
riverctl rule-add -app-id 'flameshot' csd
