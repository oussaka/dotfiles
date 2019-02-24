# dotfiles
My dot files shared between :computer: 



## Installation

> Note:
The bootstrap.exclude.sh script creates symlinks from the dotfiles in this directory to the HOME directory. Make sure that your dotfiles are backed up somewhere safe.

Open a terminal and follow along!
1. Clone this repository: `git clone https://github.com/oussaka/dotfiles`
2. CD into the folder: `cd dotfiles`
3. Execute the bootstrap script: `sh ./bootstrap.exclude.sh`
4. Restart your terminal or run `source .bash_profile`

## Customizing

- You can customize these dotfiles using `.local` files. These can be used to add custom commands or configure things that you don't want to commit to a public repo. 

For example, to overwrite stuff in the `.bash_profile` file, make a file called `.bash_profile.local` and put your stuff in there. 

> Note:
When you make a new `.local` file, you'll have to run `sh ./bootstrap.exclude.sh` before it can be used. You only have to run the linking part though, so choose `y` for that one part and `n` for the rest.


- Save env vars, etc in a .extra file, that looks something like this:

###
### Git credentials
###

GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"

GIT_AUTHOR_EMAIL="email@you.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

###
### Gmail credentials for mutt
###
export GMAIL=email@you.com
export GMAIL_NAME="Your Name"
export GMAIL_FROM=from-email@you.com
