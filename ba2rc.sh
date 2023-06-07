#!/usr/bin/env bash

aliasFile="$HOME/.bash_aliases"

[[ "$@" = "-h" ]] || [[ "$@" = "--help" ]] \
    && printf "%s\n" "$0" \
    && printf "Outputs ${aliasFile} alias entries converted to ranger rc.conf format.\n" \
	&& exit 0

[[ ! -e "$aliasFile" ]] \
	&& printf "No ${aliasFile} file found on system.\n" \
	&& exit 1

printf "# %s: The following aliases were generated from %s.\n\n" \
	"$0" "$aliasFile"

# The space at the end of "cd " is important.
grep "cd " "$aliasFile" | sed -e "s/alias\ /map\ /g" -e "s/\"//g" -e "s/=/ /g"

exit 0
