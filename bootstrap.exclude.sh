#!/bin/sh

# Initialize a few things
init () {
	echo "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
}

# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force
link () {
	echo "This utility will symlink the files in this repo to the home directory"
	echo "Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
			ln -sfv "$PWD/$file" "$HOME"
		done
		# TODO: source files here?
		echo "Symlinking complete"
	else
		echo "Symlinking cancelled by user"
		return 1
	fi
}

init
link