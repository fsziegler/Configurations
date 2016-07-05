# Git Guide
1. [Git Terminology](#git-terminology)
2. [Initialization](#initialization)
2. [Modifying Files](#modifying-files)
3. [Git Commands](#git-commands)

## Git Terminology

Git's terminology differs from that of other version control systems, so it is a good idea to start with its terminology.
### Nouns
 * Files on disk
   * **Workspace:** the set of actual files and directories in and under the top git directory.
   * *Workspace File Set:*  a set, or subset, of the files and directories in a **workspace**.
 * Databases
   * **Datastore:** any Git mechanism capable of storing one or more versions of a **workspace file set**.
   * **Stash:** a "lightweight" local **datastore** into which **workspace file set** versions can be pushed and popped. Modelled as a stack with no memory other than its contents. A **stash** and its **index** are inextricably linked.
   * **Index:** a "lightweight" local **datastore** into which multiple **workspace file set** versions can be added and removed. Retains memory only of versions added, not of versions removed nor comitted to its **local repo**. An **index** can only interact with other **repos** through its **local repo**.
   * **Repository ("Repo"):** a **datastore** into which multiple **workspace file set** versions may be stored. Retains memory of all versions added and removed. A **repo** may interact with multiple other **repos**.
   * **Local Repo:** a local **repo** into which all the **workspace file set** versions in its **index** may be moved. A local **repo** only interacts with one **index**.
   * **Remote Repo:** a networked **repo** with which a local **repo** may interact.
 * File sets
   * **Commit:** a **workspace file set** version that has been added to a **repo**.
   * **Branch:** a contiguous series of **commits** in a **repo**.
   * **Master Branch:** the original series of **commits** in a **repo**. Another branch will diverge from the **master branch** starting at a given **commit**.
 * Objects
   * **Blob:** the contents of any single file (text, binary, etc.).
   * **Tree:** any directory structure starting at a given directory.
   * **Tag:** a text string that points to a **commit**.
   * **Object:** any git **blob**, **tree**, **commit**, or **tag**.

### Verbs

All verbs are used with the syntax `git [verb] [options]` from the command line. The directory from which a command is issued is used by git to determine the **workspace file set** to operate on; the root local **repo** directory is normally used.
 * Initialization
   * **init:** Initializes a **local repo** in the current directory.
   * **clone:** Clones a **remote repo** into the current directory.
 * Branching
   * **branch:** Creates a new branch, or lists existing ones, or deletes a branch.
   * **checkout:** Synchs the **index** and **workspace file set** to a **branch**. Any differences between the initial **workspace file set** and the branch are lost (unless **add** or **stash** was called before **checkout**).
   * **merge:** Attempts to merge another **branch** into the current **branch**, giving alerts to conflicts that it cannot resolve.
   * **fetch:** Updates the **local repo** from the **remote repo** (but not the **index** nor the **workspace file set**).
   * **rebase:** Attempts to change the root **commit** of one **branch** off of another **branch** to a more recent one off of the latter **branch**, applying all of the subsequent **commits** from the former **branch** to this new root.
 * Manipulation
   * **add:** Adds a **workspace file set** to the **index**.
   * **stash:** Moves changed files in a **workspace file set** to a new position in the **stash**, placing this **workspace file set** in synch with their latest version in the **index**.
   * **commit:** Moves the **index** into the **local repo**, leaving an empty **index**.
   * **push:** Updates the **remote repo** from the **local repo**.
   * **pull:** Updates the **local repo**,  **index**, and **workspace file set** from the **remote repo**.
 * Information
   * **diff:** Shows changes between the **workspace file set** and the **index** or a **tree**, changes between the **index** and a **tree**, changes between two **trees**, changes between two **blob** objects, or changes between two files on disk.
   * **status:** Shows differences among the **workspace file set**, the **index**, and the **local repo**. Essentially shows what would be affected by calls to **add** and **commit**.

[Good tutorial on Git indexes](http://blog.osteele.com/posts/2008/05/my-git-workflow/)
"Added: This way I can checkpoint every few minutes. It’s a very cheap operation, and I don’t have to spend time cleaning up the checkpoints later. “git diff” tells me what I’ve changed since the last checkpoint; “git diff head” shows what’s changed since the last commit. “git checkout .” reverts to the last checkpoint; “git checkout head .” reverts to the last commit. And “git stash” and “git checkout -m -b” operate on the changes since the last commit, which is what I want."

![Git Data Transport Commands](http://blog.osteele.com/images/2008/git-transport.png)
![](http://blog.osteele.com/images/2008/git-workflow.png)

## Initialization

See "https://github.com/fsziegler/Configurations/blob/master/Set_up_SSH_Key.md" for instructions on setting up an SSH key so you don't need a username and password for git operations.
* Initialize the current directory as a git repo
* Clone an existing git repo into the current directory

## Modifying Files

There are five possible file states
###1. Untracked Files
* `git add [filename]` adds *filename* to the repo index
* `git add .` adds changes in all files to, removes deleted files from, and adds new files to the repo index from the workspace.
* [Instructions for pushing a new repo to GitHub](https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/)
  * `git init`
  * `git add .`
  * `git commit -m "First commit"`
  * Go to GitHub, create a new repo with NO files (e.g., README, license, .gitignore, etc.)
  * Copy this URL to the clipboard
  * `git git remote add origin [remote repository URL]`
  * `git git remote -v` verifies the new remote URL
  * `git git push origin master`

###2. Unmodified Files

Unmodified files need no action.

###3. Modified Files

Git records each time modified files are added to the index
 * `git add [filename]` adds changes in *filename* to the repo index
 * `git add -u` adds changes in all files to and removes deleted files from the repo index, but does not add new files from the workspace.
 * `git add -A` adds changes in all files to, removes deleted files from, and adds new files to the repo index from the workspace.
 * `git add -N` does not change the repo index, but `git diff` will now show what the status would be after `git add .` is run.
 * `git add -n` does not change the repo index, shows what would happen if `git add .` is run.

 * `git diff` does not change the repo index, shows what would happen if `git add .` is run.
 * `git diff` tells what has changed since the last checkpoint in the index.
 * `git diff head` shows what’s changed since the last commit in the repo.
 * `git checkout .` reverts to the last checkpoint in the index.
 * `git checkout head .` reverts to the last commit.
 * `git stash` operates on the changes since the last commit.
 * `git checkout -m -b` operates on the changes since the last commit.

###4. Staged Files

###5. <br>

###6. <br>

---

## Git Commands

### git add [options ...] [<pathspec> ... ]

**This command updates the index using the current content found in the working tree, to prepare the content staged for the next commit.** It typically adds the current content of existing paths as a whole, but with some options it can also be used to add content with only part of the changes made to the working tree files applied, or remove paths that do not exist in the working tree anymore.

**The "index" holds a snapshot of the content of the working tree, and it is this snapshot that is taken as the contents of the next commit.** Thus after making any changes to the working directory, and before running the commit command, you must use the add command to add any new or modified files to the index.

**This command can be performed multiple times before a commit. It only adds the content of the specified file(s) at the time the add command is run;** if you want subsequent changes included in the next commit, then you must run git add again to add the new content to the index.

The git status command can be used to obtain a summary of which files have changes that are staged for the next commit.

The git add command will not add ignored files by default. If any ignored files were explicitly specified on the command line, git add will fail with a list of ignored files. Ignored files reached by directory recursion or filename globbing performed by Git (quote your globs before the shell) will be silently ignored. The git add command can be used to add ignored files with the -f (force) option.


#### Options

##### Informational
* `[--verbose | -v]`
  * Be verbose.
* `[--dry-run | -n]`
  * Don’t actually add the file(s), just show if they exist and/or will be ignored.
* `[--ignore-missing]`
  * This option can only be used together with --dry-run. By using this option the user can check if any of the given files would be ignored, no matter if they are already present in the work tree or not.

##### User interaction
* `[--interactive | -i]`
  * Add modified contents in the working tree interactively to the index. Optional path arguments may be supplied to limit operation to a subset of the working tree. See “Interactive mode” for details.
* `[--patch | -p]`
  * Interactively choose hunks of patch between the index and the work tree and add them to the index. This gives the user a chance to review the difference before adding modified contents to the index. This effectively runs add --interactive, but bypasses the initial command menu and directly jumps to the patch subcommand. See “[Interactive Mode](interactive-mode)” for details.
* `[--edit | -e]`
  * Open the diff vs. the index in an editor and let the user edit it. After the editor was closed, adjust the hunk headers and apply the patch to the index.

##### Changes without Content Changes
* `[--intent-to-add | -N]`
  * Record only the fact that the path will be added later. An entry for the path is placed in the index with no content. This is useful for, among other things, showing the unstaged content of such files with git diff and committing them with git commit -a.
* `[--refresh]`
  * Don’t add the file(s), but only refresh their stat() information in the index.

##### Qualifying Options
* `[--force | -f]`
  * Allow adding otherwise ignored files. The intent of this option is to pick and choose lines of the patch to apply, or even to modify the contents of lines to be staged. This can be quicker and more flexible than using the interactive hunk selector. However, it is easy to confuse oneself and create a patch that does not apply to the index. See EDITING PATCHES below.
* `[--[no-]all | --[no-]ignore-removal | [--update | -u]]`
  * `[-A, --all, --no-ignore-removal]`
    * Update the index not only where the working tree has a file matching <pathspec> but also where the index already has an entry. This adds, modifies, and removes index entries to match the working tree.
    * If no <pathspec> is given, the current version of Git defaults to "."; in other words, update all files in the current directory and its subdirectories. This default will change in a future version of Git, hence the form without <pathspec> should not be used.
  * `[--no-all, --ignore-removal]`
    * Update the index by adding new files that are unknown to the index and files modified in the working tree, but ignore files that have been removed from the working tree. This option is a no-op when no <pathspec> is used.
    * This option is primarily to help the current users of Git, whose "git add <pathspec>..." ignores removed files. In future versions of Git, "git add <pathspec>..." will be a synonym to "git add -A <pathspec>..." and "git add --ignore-removal <pathspec>..." will behave like today’s "git add <pathspec>...", ignoring removed files.
  * `[--update | -u]`
    * Update the index just where it already has an entry matching <pathspec>. This removes as well as modifies index entries to match the working tree, but adds no new files.
    * If no <pathspec> is given, the current version of Git defaults to "."; in other words, update all tracked files in the current directory and its subdirectories. This default will change in a future version of Git, hence the form without <pathspec> should not be used.
* `[--ignore-errors]`
  * If some files could not be added because of errors indexing them, do not abort the operation, but continue adding the others. The command shall still exit with non-zero status. The configuration variable add.ignoreErrors can be set to true to make this the default behaviour.
* `[--]`
  * This option can be used to separate command-line options from the list of files, (useful when filenames might be mistaken for command-line options).
* `[<pathspec>...]`
  * *Specify files with wildcards or use "." for all files*

#### Interactive Mode
       When the command enters the interactive mode, it shows the output of the status subcommand, and then goes into its interactive command
       loop.

       The command loop shows the list of subcommands available, and gives a prompt "What now> ". In general, when the prompt ends with a single
       >, you can pick only one of the choices given and type return, like this:

               *** Commands ***
                 1: status       2: update       3: revert       4: add untracked
                 5: patch        6: diff         7: quit         8: help
               What now> 1


       You also could say s or sta or status above as long as the choice is unique.

       The main command loop has 6 subcommands (plus help and quit).

       status
           This shows the change between HEAD and index (i.e. what will be committed if you say git commit), and between index and working tree
           files (i.e. what you could stage further before git commit using git add) for each path. A sample output looks like this:

                             staged     unstaged path
                    1:       binary      nothing foo.png
                    2:     +403/-35        +1/-1 git-add--interactive.perl

           It shows that foo.png has differences from HEAD (but that is binary so line count cannot be shown) and there is no difference between
           indexed copy and the working tree version (if the working tree version were also different, binary would have been shown in place of
           nothing). The other file, git-add--interactive.perl, has 403 lines added and 35 lines deleted if you commit what is in the index, but
           working tree file has further modifications (one addition and one deletion).

       update
           This shows the status information and issues an "Update>>" prompt. When the prompt ends with double >>, you can make more than one
           selection, concatenated with whitespace or comma. Also you can say ranges. E.g. "2-5 7,9" to choose 2,3,4,5,7,9 from the list. If the
           second number in a range is omitted, all remaining patches are taken. E.g. "7-" to choose 7,8,9 from the list. You can say * to choose
           everything.

           What you chose are then highlighted with *, like this:

                          staged     unstaged path
                 1:       binary      nothing foo.png
               * 2:     +403/-35        +1/-1 git-add--interactive.perl

           To remove selection, prefix the input with - like this:

               Update>> -2

           After making the selection, answer with an empty line to stage the contents of working tree files for selected paths in the index.

       revert
           This has a very similar UI to update, and the staged information for selected paths are reverted to that of the HEAD version. Reverting
           new paths makes them untracked.

       add untracked
           This has a very similar UI to update and revert, and lets you add untracked paths to the index.

       patch
           This lets you choose one path out of a status like selection. After choosing the path, it presents the diff between the index and the
           working tree file and asks you if you want to stage the change of each hunk. You can select one of the following options and type
           return:

               y - stage this hunk
               n - do not stage this hunk
               q - quit; do not stage this hunk nor any of the remaining ones
               a - stage this hunk and all later hunks in the file
               d - do not stage this hunk nor any of the later hunks in the file
               g - select a hunk to go to
               / - search for a hunk matching the given regex
               j - leave this hunk undecided, see next undecided hunk
               J - leave this hunk undecided, see next hunk
               k - leave this hunk undecided, see previous undecided hunk
               K - leave this hunk undecided, see previous hunk
               s - split the current hunk into smaller hunks
               e - manually edit the current hunk
               ? - print help

           After deciding the fate for all hunks, if there is any hunk that was chosen, the index is updated with the selected hunks.

           You can omit having to type return here, by setting the configuration variable interactive.singlekey to true.

       diff
           This lets you review what will be committed (i.e. between HEAD and index).

EDITING PATCHES
       Invoking git add -e or selecting e from the interactive hunk selector will open a patch in your editor; after the editor exits, the result
       is applied to the index. You are free to make arbitrary changes to the patch, but note that some changes may have confusing results, or
       even result in a patch that cannot be applied. If you want to abort the operation entirely (i.e., stage nothing new in the index), simply
       delete all lines of the patch. The list below describes some common things you may see in a patch, and which editing operations make sense
       on them.

       added content
           Added content is represented by lines beginning with "+". You can prevent staging any addition lines by deleting them.

       removed content
           Removed content is represented by lines beginning with "-". You can prevent staging their removal by converting the "-" to a " "
           (space).

       modified content
           Modified content is represented by "-" lines (removing the old content) followed by "+" lines (adding the replacement content). You can
           prevent staging the modification by converting "-" lines to " ", and removing "+" lines. Beware that modifying only half of the pair is
           likely to introduce confusing changes to the index.

       There are also more complex operations that can be performed. But beware that because the patch is applied only to the index and not the
       working tree, the working tree will appear to "undo" the change in the index. For example, introducing a new line into the index that is in
       neither the HEAD nor the working tree will stage the new line for commit, but the line will appear to be reverted in the working tree.

       Avoid using these constructs, or do so with extreme caution.

       removing untouched content
           Content which does not differ between the index and working tree may be shown on context lines, beginning with a " " (space). You can
           stage context lines for removal by converting the space to a "-". The resulting working tree file will appear to re-add the content.

       modifying existing content
           One can also modify context lines by staging them for removal (by converting " " to "-") and adding a "+" line with the new content.
           Similarly, one can modify "+" lines for existing additions or modifications. In all cases, the new modification will appear reverted in
           the working tree.

       new content
           You may also add new content that does not exist in the patch; simply add new lines, each starting with "+". The addition will appear
           reverted in the working tree.

       There are also several operations which should be avoided entirely, as they will make the patch impossible to apply:

       ·   adding context (" ") or removal ("-") lines

       ·   deleting context or removal lines

       ·   modifying the contents of context or removal lines

SEE ALSO
       git-status(1) git-rm(1) git-reset(1) git-mv(1) git-commit(1) git-update-index(1)

GIT
       Part of the git(1) suite



Git 1.9.1                                                           03/21/2016                                                          GIT-ADD(1)
