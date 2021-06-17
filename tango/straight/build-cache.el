
:tanat

"27.2"

#s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data ("org-elpa" ("2021-06-17 17:41:18" nil (:local-repo nil :package "org-elpa" :type git)) "melpa" ("2021-06-17 17:41:18" nil (:type git :host github :repo "melpa/melpa" :build nil :package "melpa" :local-repo "melpa")) "gnu-elpa-mirror" ("2021-06-17 17:11:44" nil (:type git :host github :repo "emacs-straight/gnu-elpa-mirror" :build nil :package "gnu-elpa-mirror" :local-repo "gnu-elpa-mirror")) "el-get" ("2021-06-17 17:11:44" nil (:type git :host github :repo "dimitri/el-get" :build nil :files ("*.el" ("recipes" "recipes/el-get.rcp") "methods" "el-get-pkg.el") :flavor melpa :package "el-get" :local-repo "el-get")) "emacsmirror-mirror" ("2021-06-17 17:11:44" nil (:type git :host github :repo "emacs-straight/emacsmirror-mirror" :build nil :package "emacsmirror-mirror" :local-repo "emacsmirror-mirror")) "straight" ("2021-06-17 17:11:44" ("emacs") (:type git :host github :repo "raxod502/straight.el" :files ("straight*.el") :branch "master" :package "straight" :local-repo "straight.el")) "use-package" ("2021-06-17 17:11:44" ("emacs" "bind-key") (:type git :flavor melpa :files (:defaults (:exclude "bind-key.el" "bind-chord.el" "use-package-chords.el" "use-package-ensure-system-package.el") "use-package-pkg.el") :host github :repo "jwiegley/use-package" :package "use-package" :local-repo "use-package")) "bind-key" ("2021-06-17 17:11:44" nil (:flavor melpa :files ("bind-key.el" "bind-key-pkg.el") :package "bind-key" :local-repo "use-package" :type git :repo "jwiegley/use-package" :host github)) "evil" ("2021-06-17 17:11:44" ("emacs" "goto-chg" "cl-lib") (:host github :repo "emacs-evil/evil" :files (:defaults "doc/build/texinfo/evil.texi" (:exclude "evil-test-helpers.el") "evil-pkg.el") :flavor melpa :package "evil" :type git :local-repo "evil")) "goto-chg" ("2021-06-17 17:11:44" ("emacs") (:type git :flavor melpa :host github :repo "emacs-evil/goto-chg" :package "goto-chg" :local-repo "goto-chg")) "command-log-mode" ("2021-06-17 17:11:45" nil (:host github :repo "lewang/command-log-mode" :flavor melpa :package "command-log-mode" :type git :local-repo "command-log-mode")) "ivy" ("2021-06-17 17:11:45" ("emacs") (:host github :repo "abo-abo/swiper" :files (:defaults (:exclude "swiper.el" "counsel.el" "ivy-hydra.el" "ivy-avy.el") "doc/ivy-help.org" "ivy-pkg.el") :flavor melpa :package "ivy" :type git :local-repo "swiper")) "doom-themes" ("2021-06-17 17:30:53" ("emacs" "cl-lib") (:host github :repo "hlissner/emacs-doom-themes" :files (:defaults "themes/*.el" "doom-themes-pkg.el") :flavor melpa :package "doom-themes" :type git :local-repo "emacs-doom-themes")) "general" ("2021-06-17 17:41:31" ("emacs" "cl-lib") (:host github :repo "noctuid/general.el" :flavor melpa :package "general" :type git :local-repo "general.el"))))

#s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data ("straight" ((straight-autoloads straight-x straight) (autoload 'straight-remove-unused-repos "straight" "Remove unused repositories from the repos directory.
A repo is considered \"unused\" if it was not explicitly requested via
`straight-use-package' during the current Emacs session.
If FORCE is non-nil do not prompt before deleting repos.

(fn &optional FORCE)" t nil) (autoload 'straight-get-recipe "straight" "Interactively select a recipe from one of the recipe repositories.
All recipe repositories in `straight-recipe-repositories' will
first be cloned. After the recipe is selected, it will be copied
to the kill ring. With a prefix argument, first prompt for a
recipe repository to search. Only that repository will be
cloned.

From Lisp code, SOURCES should be a subset of the symbols in
`straight-recipe-repositories'. Only those recipe repositories
are cloned and searched. If it is nil or omitted, then the value
of `straight-recipe-repositories' is used. If SOURCES is the
symbol `interactive', then the user is prompted to select a
recipe repository, and a list containing that recipe repository
is used for the value of SOURCES. ACTION may be `copy' (copy
recipe to the kill ring), `insert' (insert at point), or nil (no
action, just return it).

(fn &optional SOURCES ACTION)" t nil) (autoload 'straight-visit-package-website "straight" "Interactively select a recipe, and visit the package's website." t nil) (autoload 'straight-use-package "straight" "Register, clone, build, and activate a package and its dependencies.
This is the main entry point to the functionality of straight.el.

MELPA-STYLE-RECIPE is either a symbol naming a package, or a list
whose car is a symbol naming a package and whose cdr is a
property list containing e.g. `:type', `:local-repo', `:files',
and VC backend specific keywords.

First, the package recipe is registered with straight.el. If
NO-CLONE is a function, then it is called with two arguments: the
package name as a string, and a boolean value indicating whether
the local repository for the package is available. In that case,
the return value of the function is used as the value of NO-CLONE
instead. In any case, if NO-CLONE is non-nil, then processing
stops here.

Otherwise, the repository is cloned, if it is missing. If
NO-BUILD is a function, then it is called with one argument: the
package name as a string. In that case, the return value of the
function is used as the value of NO-BUILD instead. In any case,
if NO-BUILD is non-nil, then processing halts here. Otherwise,
the package is built and activated. Note that if the package
recipe has a nil `:build' entry, then NO-BUILD is ignored
and processing always stops before building and activation
occurs.

CAUSE is a string explaining the reason why
`straight-use-package' has been called. It is for internal use
only, and is used to construct progress messages. INTERACTIVE is
non-nil if the function has been called interactively. It is for
internal use only, and is used to determine whether to show a
hint about how to install the package permanently.

Return non-nil if package was actually installed, and nil
otherwise (this can only happen if NO-CLONE is non-nil).

(fn MELPA-STYLE-RECIPE &optional NO-CLONE NO-BUILD CAUSE INTERACTIVE)" t nil) (autoload 'straight-register-package "straight" "Register a package without cloning, building, or activating it.
This function is equivalent to calling `straight-use-package'
with a non-nil argument for NO-CLONE. It is provided for
convenience. MELPA-STYLE-RECIPE is as for
`straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-use-package-no-build "straight" "Register and clone a package without building it.
This function is equivalent to calling `straight-use-package'
with nil for NO-CLONE but a non-nil argument for NO-BUILD. It is
provided for convenience. MELPA-STYLE-RECIPE is as for
`straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-use-package-lazy "straight" "Register, build, and activate a package if it is already cloned.
This function is equivalent to calling `straight-use-package'
with symbol `lazy' for NO-CLONE. It is provided for convenience.
MELPA-STYLE-RECIPE is as for `straight-use-package'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-use-recipes "straight" "Register a recipe repository using MELPA-STYLE-RECIPE.
This registers the recipe and builds it if it is already cloned.
Note that you probably want the recipe for a recipe repository to
include a nil `:build' property, to unconditionally
inhibit the build phase.

This function also adds the recipe repository to
`straight-recipe-repositories', at the end of the list.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-override-recipe "straight" "Register MELPA-STYLE-RECIPE as a recipe override.
This puts it in `straight-recipe-overrides', depending on the
value of `straight-current-profile'.

(fn MELPA-STYLE-RECIPE)" nil nil) (autoload 'straight-check-package "straight" "Rebuild a PACKAGE if it has been modified.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. See also `straight-rebuild-package' and
`straight-check-all'.

(fn PACKAGE)" t nil) (autoload 'straight-check-all "straight" "Rebuild any packages that have been modified.
See also `straight-rebuild-all' and `straight-check-package'.
This function should not be called during init." t nil) (autoload 'straight-rebuild-package "straight" "Rebuild a PACKAGE.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument RECURSIVE, rebuild
all dependencies as well. See also `straight-check-package' and
`straight-rebuild-all'.

(fn PACKAGE &optional RECURSIVE)" t nil) (autoload 'straight-rebuild-all "straight" "Rebuild all packages.
See also `straight-check-all' and `straight-rebuild-package'." t nil) (autoload 'straight-prune-build-cache "straight" "Prune the build cache.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build mtime information and any cached
autoloads discarded." nil nil) (autoload 'straight-prune-build-directory "straight" "Prune the build directory.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build directories deleted." nil nil) (autoload 'straight-prune-build "straight" "Prune the build cache and build directory.
This means that only packages that were built in the last init
run and subsequent interactive session will remain; other
packages will have their build mtime information discarded and
their build directories deleted." t nil) (autoload 'straight-normalize-package "straight" "Normalize a PACKAGE's local repository to its recipe's configuration.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'.

(fn PACKAGE)" t nil) (autoload 'straight-normalize-all "straight" "Normalize all packages. See `straight-normalize-package'.
Return a list of recipes for packages that were not successfully
normalized. If multiple packages come from the same local
repository, only one is normalized.

PREDICATE, if provided, filters the packages that are normalized.
It is called with the package name as a string, and should return
non-nil if the package should actually be normalized.

(fn &optional PREDICATE)" t nil) (autoload 'straight-fetch-package "straight" "Try to fetch a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
fetch not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-fetch-package-and-deps "straight" "Try to fetch a PACKAGE and its (transitive) dependencies.
PACKAGE, its dependencies, their dependencies, etc. are fetched
from their primary remotes.

PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
fetch not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-fetch-all "straight" "Try to fetch all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, fetch not just from primary
remotes but also from upstreams (for forked packages).

Return a list of recipes for packages that were not successfully
fetched. If multiple packages come from the same local
repository, only one is fetched.

PREDICATE, if provided, filters the packages that are fetched. It
is called with the package name as a string, and should return
non-nil if the package should actually be fetched.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload 'straight-merge-package "straight" "Try to merge a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
merge not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-merge-package-and-deps "straight" "Try to merge a PACKAGE and its (transitive) dependencies.
PACKAGE, its dependencies, their dependencies, etc. are merged
from their primary remotes.

PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
merge not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-merge-all "straight" "Try to merge all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, merge not just from primary
remotes but also from upstreams (for forked packages).

Return a list of recipes for packages that were not successfully
merged. If multiple packages come from the same local
repository, only one is merged.

PREDICATE, if provided, filters the packages that are merged. It
is called with the package name as a string, and should return
non-nil if the package should actually be merged.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload 'straight-pull-package "straight" "Try to pull a PACKAGE from the primary remote.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM, pull
not just from primary remote but also from upstream (for forked
packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-pull-package-and-deps "straight" "Try to pull a PACKAGE and its (transitive) dependencies.
PACKAGE, its dependencies, their dependencies, etc. are pulled
from their primary remotes.

PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'. With prefix argument FROM-UPSTREAM,
pull not just from primary remote but also from upstream (for
forked packages).

(fn PACKAGE &optional FROM-UPSTREAM)" t nil) (autoload 'straight-pull-all "straight" "Try to pull all packages from their primary remotes.
With prefix argument FROM-UPSTREAM, pull not just from primary
remotes but also from upstreams (for forked packages).

Return a list of recipes for packages that were not successfully
pulled. If multiple packages come from the same local repository,
only one is pulled.

PREDICATE, if provided, filters the packages that are pulled. It
is called with the package name as a string, and should return
non-nil if the package should actually be pulled.

(fn &optional FROM-UPSTREAM PREDICATE)" t nil) (autoload 'straight-push-package "straight" "Push a PACKAGE to its primary remote, if necessary.
PACKAGE is a string naming a package. Interactively, select
PACKAGE from the known packages in the current Emacs session
using `completing-read'.

(fn PACKAGE)" t nil) (autoload 'straight-push-all "straight" "Try to push all packages to their primary remotes.

Return a list of recipes for packages that were not successfully
pushed. If multiple packages come from the same local repository,
only one is pushed.

PREDICATE, if provided, filters the packages that are normalized.
It is called with the package name as a string, and should return
non-nil if the package should actually be normalized.

(fn &optional PREDICATE)" t nil) (autoload 'straight-freeze-versions "straight" "Write version lockfiles for currently activated packages.
This implies first pushing all packages that have unpushed local
changes. If the package management system has been used since the
last time the init-file was reloaded, offer to fix the situation
by reloading the init-file again. If FORCE is
non-nil (interactively, if a prefix argument is provided), skip
all checks and write the lockfile anyway.

Currently, writing version lockfiles requires cloning all lazily
installed packages. Hopefully, this inconvenient requirement will
be removed in the future.

Multiple lockfiles may be written (one for each profile),
according to the value of `straight-profiles'.

(fn &optional FORCE)" t nil) (autoload 'straight-thaw-versions "straight" "Read version lockfiles and restore package versions to those listed." t nil) (autoload 'straight-bug-report "straight" "Test straight.el in a clean environment.
ARGS may be any of the following keywords and their respective values:
  - :pre-bootstrap (Form)...
      Forms evaluated before bootstrapping straight.el
      e.g. (setq straight-repository-branch \"develop\")
      Note this example is already in the default bootstrapping code.

  - :post-bootstrap (Form)...
      Forms evaluated in the testing environment after boostrapping.
      e.g. (straight-use-package '(example :type git :host github))

  - :interactive Boolean
      If nil, the subprocess will immediately exit after the test.
      Output will be printed to `straight-bug-report--process-buffer'
      Otherwise, the subprocess will be interactive.

  - :preserve Boolean
      If non-nil, the test directory is left in the directory stored in the
      variable `temporary-file-directory'. Otherwise, it is
      immediately removed after the test is run.

  - :executable String
      Indicate the Emacs executable to launch.
      Defaults to the path of the current Emacs executable.

  - :raw Boolean
      If non-nil, the raw process output is sent to
      `straight-bug-report--process-buffer'. Otherwise, it is
      formatted as markdown for submitting as an issue.

  - :user-dir String
      If non-nil, the test is run with `user-emacs-directory' set to STRING.
      Otherwise, a temporary directory is created and used.
      Unless absolute, paths are expanded relative to the variable
      `temporary-file-directory'.

ARGS are accessible within the :pre/:post-bootsrap phases via the
locally bound plist, straight-bug-report-args.

(fn &rest ARGS)" nil t) (function-put 'straight-bug-report 'lisp-indent-function '0) (autoload 'straight-dependencies "straight" "Return a list of PACKAGE's dependencies.

(fn &optional PACKAGE)" t nil) (autoload 'straight-dependents "straight" "Return a list PACKAGE's dependents.

(fn &optional PACKAGE)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "straight" '("straight-"))) (defvar straight-x-pinned-packages nil "List of pinned packages.") (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "straight-x" '("straight-x-"))) (provide 'straight-autoloads)) "bind-key" ((bind-key-autoloads bind-key) (autoload 'bind-key "bind-key" "Bind KEY-NAME to COMMAND in KEYMAP (`global-map' if not passed).

KEY-NAME may be a vector, in which case it is passed straight to
`define-key'. Or it may be a string to be interpreted as
spelled-out keystrokes, e.g., \"C-c C-z\". See documentation of
`edmacro-mode' for details.

COMMAND must be an interactive function or lambda form.

KEYMAP, if present, should be a keymap variable or symbol.
For example:

  (bind-key \"M-h\" #'some-interactive-function my-mode-map)

  (bind-key \"M-h\" #'some-interactive-function 'my-mode-map)

If PREDICATE is non-nil, it is a form evaluated to determine when
a key should be bound. It must return non-nil in such cases.
Emacs can evaluate this form at any time that it does redisplay
or operates on menu data structures, so you should write it so it
can safely be called at any time.

(fn KEY-NAME COMMAND &optional KEYMAP PREDICATE)" nil t) (autoload 'unbind-key "bind-key" "Unbind the given KEY-NAME, within the KEYMAP (if specified).
See `bind-key' for more details.

(fn KEY-NAME &optional KEYMAP)" nil t) (autoload 'bind-key* "bind-key" "Similar to `bind-key', but overrides any mode-specific bindings.

(fn KEY-NAME COMMAND &optional PREDICATE)" nil t) (autoload 'bind-keys "bind-key" "Bind multiple keys at once.

Accepts keyword arguments:
:map MAP               - a keymap into which the keybindings should be
                         added
:prefix KEY            - prefix key for these bindings
:prefix-map MAP        - name of the prefix map that should be created
                         for these bindings
:prefix-docstring STR  - docstring for the prefix-map variable
:menu-name NAME        - optional menu string for prefix map
:filter FORM           - optional form to determine when bindings apply

The rest of the arguments are conses of keybinding string and a
function symbol (unquoted).

(fn &rest ARGS)" nil t) (autoload 'bind-keys* "bind-key" "

(fn &rest ARGS)" nil t) (autoload 'describe-personal-keybindings "bind-key" "Display all the personal keybindings defined by `bind-key'." t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bind-key" '("bind-key" "compare-keybindings" "get-binding-description" "override-global-m" "personal-keybindings"))) (provide 'bind-key-autoloads)) "use-package" ((use-package-delight use-package-diminish use-package-jump use-package-core use-package use-package-lint use-package-ensure use-package-autoloads use-package-bind-key) (autoload 'use-package-autoload-keymap "use-package-bind-key" "Loads PACKAGE and then binds the key sequence used to invoke
this function to KEYMAP-SYMBOL. It then simulates pressing the
same key sequence a again, so that the next key pressed is routed
to the newly loaded keymap.

This function supports use-package's :bind-keymap keyword. It
works by binding the given key sequence to an invocation of this
function for a particular keymap. The keymap is expected to be
defined by the package. In this way, loading the package is
deferred until the prefix key sequence is pressed.

(fn KEYMAP-SYMBOL PACKAGE OVERRIDE)" nil nil) (autoload 'use-package-normalize-binder "use-package-bind-key" "

(fn NAME KEYWORD ARGS)" nil nil) (defalias 'use-package-normalize/:bind 'use-package-normalize-binder) (defalias 'use-package-normalize/:bind* 'use-package-normalize-binder) (defalias 'use-package-autoloads/:bind 'use-package-autoloads-mode) (defalias 'use-package-autoloads/:bind* 'use-package-autoloads-mode) (autoload 'use-package-handler/:bind "use-package-bind-key" "

(fn NAME KEYWORD ARGS REST STATE &optional BIND-MACRO)" nil nil) (defalias 'use-package-normalize/:bind-keymap 'use-package-normalize-binder) (defalias 'use-package-normalize/:bind-keymap* 'use-package-normalize-binder) (autoload 'use-package-handler/:bind-keymap "use-package-bind-key" "

(fn NAME KEYWORD ARGS REST STATE &optional OVERRIDE)" nil nil) (autoload 'use-package-handler/:bind-keymap* "use-package-bind-key" "

(fn NAME KEYWORD ARG REST STATE)" nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "use-package-bind-key" '("use-package-handler/:bind*"))) (autoload 'use-package "use-package-core" "Declare an Emacs package by specifying a group of configuration options.

For full documentation, please see the README file that came with
this file.  Usage:

  (use-package package-name
     [:keyword [option]]...)

:init            Code to run before PACKAGE-NAME has been loaded.
:config          Code to run after PACKAGE-NAME has been loaded.  Note that
                 if loading is deferred for any reason, this code does not
                 execute until the lazy load has occurred.
:preface         Code to be run before everything except `:disabled'; this
                 can be used to define functions for use in `:if', or that
                 should be seen by the byte-compiler.

:mode            Form to be added to `auto-mode-alist'.
:magic           Form to be added to `magic-mode-alist'.
:magic-fallback  Form to be added to `magic-fallback-mode-alist'.
:interpreter     Form to be added to `interpreter-mode-alist'.

:commands        Define autoloads for commands that will be defined by the
                 package.  This is useful if the package is being lazily
                 loaded, and you wish to conditionally call functions in your
                 `:init' block that are defined in the package.
:hook            Specify hook(s) to attach this package to.

:bind            Bind keys, and define autoloads for the bound commands.
:bind*           Bind keys, and define autoloads for the bound commands,
                 *overriding all minor mode bindings*.
:bind-keymap     Bind a key prefix to an auto-loaded keymap defined in the
                 package.  This is like `:bind', but for keymaps.
:bind-keymap*    Like `:bind-keymap', but overrides all minor mode bindings

:defer           Defer loading of a package -- this is implied when using
                 `:commands', `:bind', `:bind*', `:mode', `:magic', `:hook',
                 `:magic-fallback', or `:interpreter'.  This can be an integer,
                 to force loading after N seconds of idle time, if the package
                 has not already been loaded.
:after           Delay the use-package declaration until after the named modules
                 have loaded. Once load, it will be as though the use-package
                 declaration (without `:after') had been seen at that moment.
:demand          Prevent the automatic deferred loading introduced by constructs
                 such as `:bind' (see `:defer' for the complete list).

:if EXPR         Initialize and load only if EXPR evaluates to a non-nil value.
:disabled        The package is ignored completely if this keyword is present.
:defines         Declare certain variables to silence the byte-compiler.
:functions       Declare certain functions to silence the byte-compiler.
:load-path       Add to the `load-path' before attempting to load the package.
:diminish        Support for diminish.el (if installed).
:delight         Support for delight.el (if installed).
:custom          Call `custom-set' or `set-default' with each variable
                 definition without modifying the Emacs `custom-file'.
                 (compare with `custom-set-variables').
:custom-face     Call `customize-set-faces' with each face definition.
:ensure          Loads the package using package.el if necessary.
:pin             Pin the package to an archive.

(fn NAME &rest ARGS)" nil t) (function-put 'use-package 'lisp-indent-function '1) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "use-package-core" '("use-package-"))) (autoload 'use-package-normalize/:delight "use-package-delight" "Normalize arguments to delight.

(fn NAME KEYWORD ARGS)" nil nil) (autoload 'use-package-handler/:delight "use-package-delight" "

(fn NAME KEYWORD ARGS REST STATE)" nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "use-package-delight" '("use-package-normalize-delight"))) (autoload 'use-package-normalize/:diminish "use-package-diminish" "

(fn NAME KEYWORD ARGS)" nil nil) (autoload 'use-package-handler/:diminish "use-package-diminish" "

(fn NAME KEYWORD ARG REST STATE)" nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "use-package-diminish" '("use-package-normalize-diminish"))) (autoload 'use-package-normalize/:ensure "use-package-ensure" "

(fn NAME KEYWORD ARGS)" nil nil) (autoload 'use-package-handler/:ensure "use-package-ensure" "

(fn NAME KEYWORD ENSURE REST STATE)" nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "use-package-ensure" '("use-package-"))) (autoload 'use-package-jump-to-package-form "use-package-jump" "Attempt to find and jump to the `use-package' form that loaded
PACKAGE. This will only find the form if that form actually
required PACKAGE. If PACKAGE was previously required then this
function will jump to the file that originally required PACKAGE
instead.

(fn PACKAGE)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "use-package-jump" '("use-package-find-require"))) (autoload 'use-package-lint "use-package-lint" "Check for errors in use-package declarations.
For example, if the module's `:if' condition is met, but even
with the specified `:load-path' the module cannot be found." t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "use-package-lint" '("use-package-lint-declaration"))) (provide 'use-package-autoloads)) "goto-chg" ((goto-chg-autoloads goto-chg) (autoload 'goto-last-change "goto-chg" "Go to the point where the last edit was made in the current buffer.
Repeat the command to go to the second last edit, etc.

To go back to more recent edit, the reverse of this command, use \\[goto-last-change-reverse]
or precede this command with \\[universal-argument] - (minus).

It does not go to the same point twice even if there has been many edits
there. I call the minimal distance between distinguishable edits \"span\".
Set variable `glc-default-span' to control how close is \"the same point\".
Default span is 8.
The span can be changed temporarily with \\[universal-argument] right before \\[goto-last-change]:
\\[universal-argument] <NUMBER> set current span to that number,
\\[universal-argument] (no number) multiplies span by 4, starting with default.
The so set span remains until it is changed again with \\[universal-argument], or the consecutive
repetition of this command is ended by any other command.

When span is zero (i.e. \\[universal-argument] 0) subsequent \\[goto-last-change] visits each and
every point of edit and a message shows what change was made there.
In this case it may go to the same point twice.

This command uses undo information. If undo is disabled, so is this command.
At times, when undo information becomes too large, the oldest information is
discarded. See variable `undo-limit'.

(fn ARG)" t nil) (autoload 'goto-last-change-reverse "goto-chg" "Go back to more recent changes after \\[goto-last-change] have been used.
See `goto-last-change' for use of prefix argument.

(fn ARG)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "goto-chg" '("glc-"))) (provide 'goto-chg-autoloads)) "evil" ((evil-states evil-integration evil-digraphs evil-ex evil-types evil-commands evil-common evil-maps evil-pkg evil-development evil evil-command-window evil-core evil-repeat evil-jumps evil-search evil-keybindings evil-macros evil-autoloads evil-vars) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-command-window" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-commands" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-common" '("bounds-of-evil-" "evil-" "forward-evil-"))) (autoload 'evil-mode "evil" nil t) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-core" '("evil-" "turn-o"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-digraphs" '("evil-digraph"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-ex" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-integration" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-jumps" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-macros" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-maps" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-repeat" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-search" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-states" '("evil-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-types" '("evil-ex-get-optional-register-and-count"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-vars" '("evil-"))) (provide 'evil-autoloads)) "command-log-mode" ((command-log-mode-autoloads command-log-mode) (autoload 'command-log-mode "command-log-mode" "Toggle keyboard command logging.

If called interactively, enable Command-Log mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

(fn &optional ARG)" t nil) (autoload 'clm/toggle-command-log-buffer "command-log-mode" "Toggle the command log showing or not.

(fn &optional ARG)" t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "command-log-mode" '("clm/" "command-log-mode-" "global-command-log-mode"))) (provide 'command-log-mode-autoloads)) "ivy" ((ivy-overlay ivy-faces colir elpa ivy-autoloads ivy) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "colir" '("colir-"))) (autoload 'ivy-resume "ivy" "Resume the last completion session, or SESSION if non-nil.
With a prefix arg, try to restore a recorded completion session,
if one exists.

(fn &optional SESSION)" t nil) (autoload 'ivy-read "ivy" "Read a string in the minibuffer, with completion.

PROMPT is a string, normally ending in a colon and a space.
`ivy-count-format' is prepended to PROMPT during completion.

COLLECTION is either a list of strings, a function, an alist, or
a hash table, supplied for `minibuffer-completion-table'.

PREDICATE is applied to filter out the COLLECTION immediately.
This argument is for compatibility with `completing-read'.

When REQUIRE-MATCH is non-nil, only members of COLLECTION can be
selected.

If INITIAL-INPUT is non-nil, then insert that input in the
minibuffer initially.

HISTORY is a name of a variable to hold the completion session
history.

KEYMAP is composed with `ivy-minibuffer-map'.

PRESELECT, when non-nil, determines which one of the candidates
matching INITIAL-INPUT to select initially.  An integer stands
for the position of the desired candidate in the collection,
counting from zero.  Otherwise, use the first occurrence of
PRESELECT in the collection.  Comparison is first done with
`equal'.  If that fails, and when applicable, match PRESELECT as
a regular expression.

DEF is for compatibility with `completing-read'.

UPDATE-FN is called each time the candidate list is re-displayed.

When SORT is non-nil, `ivy-sort-functions-alist' determines how
to sort candidates before displaying them.

ACTION is a function to call after selecting a candidate.
It takes one argument, the selected candidate. If COLLECTION is
an alist, the argument is a cons cell, otherwise it's a string.

MULTI-ACTION, when non-nil, is called instead of ACTION when
there are marked candidates. It takes the list of candidates as
its only argument. When it's nil, ACTION is called on each marked
candidate.

UNWIND is a function of no arguments to call before exiting.

RE-BUILDER is a function transforming input text into a regex
pattern.

MATCHER is a function which can override how candidates are
filtered based on user input.  It takes a regex pattern and a
list of candidates, and returns the list of matching candidates.

DYNAMIC-COLLECTION is a boolean specifying whether the list of
candidates is updated after each input by calling COLLECTION.

EXTRA-PROPS is a plist that can be used to store
collection-specific session-specific data.

CALLER is a symbol to uniquely identify the caller to `ivy-read'.
It is used, along with COLLECTION, to determine which
customizations apply to the current completion session.

(fn PROMPT COLLECTION &key PREDICATE REQUIRE-MATCH INITIAL-INPUT HISTORY PRESELECT DEF KEYMAP UPDATE-FN SORT ACTION MULTI-ACTION UNWIND RE-BUILDER MATCHER DYNAMIC-COLLECTION EXTRA-PROPS CALLER)" nil nil) (autoload 'ivy-completing-read "ivy" "Read a string in the minibuffer, with completion.

This interface conforms to `completing-read' and can be used for
`completing-read-function'.

PROMPT is a string that normally ends in a colon and a space.
COLLECTION is either a list of strings, an alist, an obarray, or a hash table.
PREDICATE limits completion to a subset of COLLECTION.
REQUIRE-MATCH is a boolean value or a symbol.  See `completing-read'.
INITIAL-INPUT is a string inserted into the minibuffer initially.
HISTORY is a list of previously selected inputs.
DEF is the default value.
INHERIT-INPUT-METHOD is currently ignored.

(fn PROMPT COLLECTION &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HISTORY DEF INHERIT-INPUT-METHOD)" nil nil) (defvar ivy-mode nil "Non-nil if Ivy mode is enabled.
See the `ivy-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ivy-mode'.") (custom-autoload 'ivy-mode "ivy" nil) (autoload 'ivy-mode "ivy" "Toggle Ivy mode on or off.
Turn Ivy mode on if ARG is positive, off otherwise.
Turning on Ivy mode sets `completing-read-function' to
`ivy-completing-read'.

Global bindings:
\\{ivy-mode-map}

Minibuffer bindings:
\\{ivy-minibuffer-map}

(fn &optional ARG)" t nil) (autoload 'ivy-switch-buffer "ivy" "Switch to another buffer." t nil) (autoload 'ivy-switch-view "ivy" "Switch to one of the window views stored by `ivy-push-view'." t nil) (autoload 'ivy-switch-buffer-other-window "ivy" "Switch to another buffer in another window." t nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ivy" '("ivy-" "with-ivy-window"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ivy-overlay" '("ivy-"))) (provide 'ivy-autoloads)) "doom-themes" ((doom-plain-theme doom-wilmersdorf-theme doom-nord-light-theme doom-tomorrow-day-theme doom-themes doom-themes-base doom-Iosvkem-theme doom-solarized-light-theme doom-challenger-deep-theme doom-ephemeral-theme doom-miramare-theme doom-spacegrey-theme doom-monokai-machine-theme doom-acario-light-theme doom-homage-black-theme doom-moonlight-theme doom-monokai-octagon-theme doom-xcode-theme doom-themes-ext-org doom-nova-theme doom-monokai-ristretto-theme doom-themes-ext-treemacs doom-gruvbox-light-theme doom-ayu-mirage-theme doom-palenight-theme doom-tomorrow-night-theme doom-acario-dark-theme doom-monokai-classic-theme doom-sourcerer-theme doom-fairy-floss-theme doom-city-lights-theme doom-outrun-electric-theme doom-gruvbox-theme doom-plain-dark-theme doom-opera-theme doom-one-theme doom-themes-ext-visual-bell doom-dark+-theme doom-shades-of-purple-theme doom-1337-theme doom-themes-ext-neotree doom-one-light-theme doom-horizon-theme doom-henna-theme doom-solarized-dark-high-contrast-theme doom-material-theme doom-opera-light-theme doom-ayu-light-theme doom-flatwhite-theme doom-solarized-dark-theme doom-dracula-theme doom-manegarm-theme doom-peacock-theme doom-zenburn-theme doom-laserwave-theme doom-badger-theme doom-monokai-pro-theme doom-molokai-theme doom-nord-theme doom-old-hope-theme doom-vibrant-theme doom-ir-black-theme doom-homage-white-theme doom-themes-autoloads doom-monokai-spectrum-theme doom-oceanic-next-theme doom-rouge-theme doom-snazzy-theme) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-1337-theme" '("doom-1337"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-Iosvkem-theme" '("doom-Iosvkem"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-acario-dark-theme" '("doom-acario-dark"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-acario-light-theme" '("doom-acario-light"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-ayu-light-theme" '("doom-ayu-light"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-ayu-mirage-theme" '("doom-ayu-mirage"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-badger-theme" '("doom-badger"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-challenger-deep-theme" '("doom-challenger-deep"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-city-lights-theme" '("doom-city-lights"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-dark+-theme" '("doom-dark+"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-dracula-theme" '("doom-dracula"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-ephemeral-theme" '("doom-ephemeral"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-fairy-floss-theme" '("doom-fairy-floss"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-flatwhite-theme" '("doom-f"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-gruvbox-light-theme" '("doom-gruvbox-light"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-gruvbox-theme" '("doom-gruvbox"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-henna-theme" '("doom-henna"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-homage-black-theme" '("doom-homage-black"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-homage-white-theme" '("doom-homage-white"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-horizon-theme" '("doom-horizon"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-ir-black-theme" '("doom-ir-black"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-laserwave-theme" '("doom-laserwave"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-manegarm-theme" '("doom-manegarm"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-material-theme" '("doom-material"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-miramare-theme" '("doom-miramare"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-molokai-theme" '("doom-molokai"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-monokai-classic-theme" '("doom-monokai-classic"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-monokai-machine-theme" '("doom-monokai-machine"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-monokai-octagon-theme" '("doom-monokai-octagon"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-monokai-pro-theme" '("doom-monokai-pro"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-monokai-ristretto-theme" '("doom-monokai-ristretto"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-monokai-spectrum-theme" '("doom-monokai-spectrum"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-moonlight-theme" '("doom-moonlight"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-nord-light-theme" '("doom-nord-light"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-nord-theme" '("doom-nord"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-nova-theme" '("doom-nova"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-oceanic-next-theme" '("doom-oceanic-next"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-old-hope-theme" '("doom-old-hope"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-one-light-theme" '("doom-one-light"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-one-theme" '("doom-one"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-opera-light-theme" '("doom-opera-light"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-opera-theme" '("doom-opera"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-outrun-electric-theme" '("doom-outrun-electric"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-palenight-theme" '("doom-palenight"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-peacock-theme" '("doom-peacock"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-plain-dark-theme" '("doom-plain-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-plain-theme" '("doom-plain"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-rouge-theme" '("doom-rouge"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-shades-of-purple-theme" '("doom-shades-of-purple"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-snazzy-theme" '("doom-snazzy"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-solarized-dark-high-contrast-theme" '("doom-solarized-dark-high-contrast"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-solarized-dark-theme" '("doom-solarized-dark"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-solarized-light-theme" '("doom-solarized-light"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-sourcerer-theme" '("doom-sourcerer"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-spacegrey-theme" '("doom-spacegrey"))) (autoload 'doom-name-to-rgb "doom-themes" "Retrieves the hexidecimal string repesented the named COLOR (e.g. \"red\")
for FRAME (defaults to the current frame).

(fn COLOR)" nil nil) (autoload 'doom-blend "doom-themes" "Blend two colors (hexidecimal strings) together by a coefficient ALPHA (a
float between 0 and 1)

(fn COLOR1 COLOR2 ALPHA)" nil nil) (autoload 'doom-darken "doom-themes" "Darken a COLOR (a hexidecimal string) by a coefficient ALPHA (a float between
0 and 1).

(fn COLOR ALPHA)" nil nil) (autoload 'doom-lighten "doom-themes" "Brighten a COLOR (a hexidecimal string) by a coefficient ALPHA (a float
between 0 and 1).

(fn COLOR ALPHA)" nil nil) (autoload 'doom-color "doom-themes" "Retrieve a specific color named NAME (a symbol) from the current theme.

(fn NAME &optional TYPE)" nil nil) (autoload 'doom-ref "doom-themes" "TODO

(fn FACE PROP &optional CLASS)" nil nil) (autoload 'doom-themes-set-faces "doom-themes" "Customize THEME (a symbol) with FACES.

If THEME is nil, it applies to all themes you load. FACES is a list of Doom
theme face specs. These is a simplified spec. For example:

  (doom-themes-set-faces 'user
    '(default :background red :foreground blue)
    '(doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
    '(doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
    '(doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
    '(doom-modeline-buffer-project-root :foreground green :weight 'bold))

(fn THEME &rest FACES)" nil nil) (function-put 'doom-themes-set-faces 'lisp-indent-function 'defun) (when (and (boundp 'custom-theme-load-path) load-file-name) (let* ((base (file-name-directory load-file-name)) (dir (expand-file-name "themes/" base))) (add-to-list 'custom-theme-load-path (or (and (file-directory-p dir) dir) base)))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes" '("def-doom-theme" "doom-"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes-base" '("doom-themes-base-"))) (autoload 'doom-themes-neotree-config "doom-themes-ext-neotree" "Install doom-themes' neotree configuration.

Includes an Atom-esque icon theme and highlighting based on filetype." nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes-ext-neotree" '("doom-"))) (autoload 'doom-themes-org-config "doom-themes-ext-org" "Load `doom-themes-ext-org'." nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes-ext-org" '("doom-themes-"))) (autoload 'doom-themes-treemacs-config "doom-themes-ext-treemacs" "Install doom-themes' treemacs configuration.

Includes an Atom-esque icon theme and highlighting based on filetype." nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes-ext-treemacs" '("doom-themes-"))) (autoload 'doom-themes-visual-bell-fn "doom-themes-ext-visual-bell" "Blink the mode-line red briefly. Set `ring-bell-function' to this to use it." nil nil) (autoload 'doom-themes-visual-bell-config "doom-themes-ext-visual-bell" "Enable flashing the mode-line on error." nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-tomorrow-day-theme" '("doom-tomorrow-day"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-tomorrow-night-theme" '("doom-tomorrow-night"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-vibrant-theme" '("doom-vibrant"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-wilmersdorf-theme" '("doom-wilmersdorf"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-xcode-theme" '("doom-xcode"))) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-zenburn-theme" '("doom-zenburn"))) (provide 'doom-themes-autoloads)) "general" ((\.dirs-local general-autoloads general) (autoload 'general-define-key "general" "The primary key definition function provided by general.el.

Define MAPS, optionally using DEFINER, in the keymap(s) corresponding to STATES
and KEYMAPS.

MAPS consists of paired keys (vectors or strings; also see
`general-implicit-kbd') and definitions (those mentioned in `define-key''s
docstring and general.el's \"extended\" definitions). All pairs (when not
ignored) will be recorded and can be later displayed with
`general-describe-keybindings'.

If DEFINER is specified, a custom key definer will be used to bind MAPS. See
general.el's documentation/README for more information.

Unlike with normal key definitions functions, the keymaps in KEYMAPS should be
quoted (this allows using the keymap name for other purposes, e.g. deferring
keybindings if the keymap symbol is not bound, optionally inferring the
corresponding major mode for a symbol by removing \"-map\" for :which-key,
easily storing the keymap name for use with `general-describe-keybindings',
etc.). Note that general.el provides other key definer macros that do not
require quoting keymaps.

STATES corresponds to the evil state(s) to bind the keys in. Non-evil users
should not set STATES. When STATES is non-nil, `evil-define-key*' will be
used (the evil auxiliary keymaps corresponding STATES and KEYMAPS will be used);
otherwise `define-key' will be used (unless DEFINER is specified). KEYMAPS
defaults to 'global. There is also 'local, which create buffer-local
keybindings for both evil and non-evil keybindings. There are other special,
user-alterable \"shorthand\" symbols for keymaps and states (see
`general-keymap-aliases' and `general-state-aliases').

Note that STATES and KEYMAPS can either be lists or single symbols. If any
keymap does not exist, those keybindings will be deferred until the keymap does
exist, so using `eval-after-load' is not necessary with this function.

PREFIX corresponds to a key to prefix keys in MAPS with and defaults to none. To
bind/unbind a key specified with PREFIX, \"\" can be specified as a key in
MAPS (e.g. ...:prefix \"SPC\" \"\" nil... will unbind space).

The keywords in this paragraph are only useful for evil users. If
NON-NORMAL-PREFIX is specified, this prefix will be used instead of PREFIX for
states in `general-non-normal-states' (e.g. the emacs and insert states). This
argument will only have an effect if one of these states is in STATES or if
corresponding global keymap (e.g. `evil-insert-state-map') is in KEYMAPS.
Alternatively, GLOBAL-PREFIX can be used with PREFIX and/or NON-NORMAL-PREFIX to
bind keys in all states under the specified prefix. Like with NON-NORMAL-PREFIX,
GLOBAL-PREFIX will prevent PREFIX from applying to `general-non-normal-states'.
INFIX can be used to append a string to all of the specified prefixes. This is
potentially useful when you are using GLOBAL-PREFIX and/or NON-NORMAL-PREFIX so
that you can sandwich keys in between all the prefixes and the specified keys in
MAPS. This may be particularly useful if you are using default prefixes in a
wrapper function/macro so that you can add to them without needing to re-specify
all of them. If none of the other prefix keyword arguments are specified, INFIX
will have no effect.

If PREFIX-COMMAND or PREFIX-MAP is specified, a prefix command and/or keymap
will be created. PREFIX-NAME can be additionally specified to set the keymap
menu name/prompt. If PREFIX-COMMAND is specified, `define-prefix-command' will
be used. Otherwise, only a prefix keymap will be created. Previously created
prefix commands/keymaps will never be redefined/cleared. All prefixes (including
the INFIX key, if specified) will then be bound to PREFIX-COMMAND or PREFIX-MAP.
If the user did not specify any PREFIX or manually specify any KEYMAPS, general
will bind all MAPS in the prefix keymap corresponding to either PREFIX-MAP or
PREFIX-COMMAND instead of in the default keymap.

PREDICATE corresponds to a predicate to check to determine whether a definition
should be active (e.g. \":predicate '(eobp)\"). Definitions created with a
predicate will only be active when the predicate is true. When the predicate is
false, key lookup will continue to search for a match in lower-precedence
keymaps.

In addition to the normal definitions supported by `define-key', general.el also
provides \"extended\" definitions, which are plists containing the normal
definition as well as other keywords. For example, PREDICATE can be specified
globally or locally in an extended definition. New global (~general-define-key~)
and local (extended definition) keywords can be added by the user. See
`general-extended-def-keywords' and general.el's documentation/README for more
information.

PACKAGE is the global version of the extended definition keyword that specifies
the package a keymap is defined in (used for \"autoloading\" keymaps)

PROPERTIES, REPEAT, and JUMP are the global versions of the extended definition
keywords used for adding evil command properties to commands.

MAJOR-MODES, WK-MATCH-KEYS, WK-MATCH-BINDINGS, and WK-FULL-KEYS are the
corresponding global versions of which-key extended definition keywords. They
will only have an effect for extended definitions that specify :which-key or
:wk. See the section on extended definitions in the general.el
documentation/README for more information.

LISPY-PLIST and WORF-PLIST are the global versions of extended definition
keywords that are used for each corresponding custom DEFINER.

(fn &rest MAPS &key DEFINER (STATES general-default-states) (KEYMAPS general-default-keymaps KEYMAPS-SPECIFIED-P) (PREFIX general-default-prefix) (NON-NORMAL-PREFIX general-default-non-normal-prefix) (GLOBAL-PREFIX general-default-global-prefix) INFIX PREFIX-COMMAND PREFIX-MAP PREFIX-NAME PREDICATE PACKAGE PROPERTIES REPEAT JUMP MAJOR-MODES (WK-MATCH-KEYS t) (WK-MATCH-BINDING t) (WK-FULL-KEYS t) LISPY-PLIST WORF-PLIST &allow-other-keys)" nil nil) (autoload 'general-emacs-define-key "general" "A wrapper for `general-define-key' that is similar to `define-key'.
It has a positional argument for KEYMAPS (that will not be overridden by a later
:keymaps argument). Besides this, it acts the same as `general-define-key', and
ARGS can contain keyword arguments in addition to keybindings. This can
basically act as a drop-in replacement for `define-key', and unlike with
`general-define-key', KEYMAPS does not need to be quoted.

(fn KEYMAPS &rest ARGS)" nil t) (function-put 'general-emacs-define-key 'lisp-indent-function '1) (autoload 'general-evil-define-key "general" "A wrapper for `general-define-key' that is similar to `evil-define-key'.
It has positional arguments for STATES and KEYMAPS (that will not be overridden
by a later :keymaps or :states argument). Besides this, it acts the same as
`general-define-key', and ARGS can contain keyword arguments in addition to
keybindings. This can basically act as a drop-in replacement for
`evil-define-key', and unlike with `general-define-key', KEYMAPS does not need
to be quoted.

(fn STATES KEYMAPS &rest ARGS)" nil t) (function-put 'general-evil-define-key 'lisp-indent-function '2) (autoload 'general-def "general" "General definer that takes a variable number of positional arguments in ARGS.
This macro will act as `general-define-key', `general-emacs-define-key', or
`general-evil-define-key' based on how many of the initial arguments do not
correspond to keybindings. All quoted and non-quoted lists and symbols before
the first string, vector, or keyword are considered to be positional arguments.
This means that you cannot use a function or variable for a key that starts
immediately after the positional arguments. If you need to do this, you should
use one of the definers that `general-def' dispatches to or explicitly separate
the positional arguments from the maps with a bogus keyword pair like
\":start-maps t\"

(fn &rest ARGS)" nil t) (function-put 'general-def 'lisp-indent-function 'defun) (autoload 'general-create-definer "general" "A helper macro to create wrappers for `general-def'.
This can be used to create key definers that will use a certain keymap, evil
state, prefix key, etc. by default. NAME is the wrapper name and DEFAULTS are
the default arguments. WRAPPING can also be optionally specified to use a
different definer than `general-def'. It should not be quoted.

(fn NAME &rest DEFAULTS &key WRAPPING &allow-other-keys)" nil t) (function-put 'general-create-definer 'lisp-indent-function 'defun) (autoload 'general-defs "general" "A wrapper that splits into multiple `general-def's.
Each consecutive grouping of positional argument followed by keyword/argument
pairs (having only one or the other is fine) marks the start of a new section.
Each section corresponds to one use of `general-def'. This means that settings
only apply to the keybindings that directly follow.

Since positional arguments can appear at any point, unqouted symbols are always
considered to be positional arguments (e.g. a keymap). This means that variables
can never be used for keys with `general-defs'. Variables can still be used for
definitions or as arguments to keywords.

(fn &rest ARGS)" nil t) (function-put 'general-defs 'lisp-indent-function 'defun) (autoload 'general-unbind "general" "A wrapper for `general-def' to unbind multiple keys simultaneously.
Insert after all keys in ARGS before passing ARGS to `general-def.' \":with
 #'func\" can optionally specified to use a custom function instead (e.g.
 `ignore').

(fn &rest ARGS)" nil t) (function-put 'general-unbind 'lisp-indent-function 'defun) (autoload 'general-describe-keybindings "general" "Show all keys that have been bound with general in an org buffer.
Any local keybindings will be shown first followed by global keybindings.
With a non-nil prefix ARG only show bindings in active maps.

(fn &optional ARG)" t nil) (autoload 'general-key "general" "Act as KEY's definition in the current context.
This uses an extended menu item's capability of dynamically computing a
definition. It is recommended over `general-simulate-key' wherever possible. See
the docstring of `general-simulate-key' and the readme for information about the
benefits and downsides of `general-key'.

KEY should be a string given in `kbd' notation and should correspond to a single
definition (as opposed to a sequence of commands). When STATE is specified, look
up KEY with STATE as the current evil state. When specified, DOCSTRING will be
the menu item's name/description.

Let can be used to bind variables around key lookup. For example:
(general-key \"some key\"
  :let ((some-var some-val)))

SETUP and TEARDOWN can be used to run certain functions before and after key
lookup. For example, something similar to using :state 'emacs would be:
(general-key \"some key\"
  :setup (evil-local-mode -1)
  :teardown (evil-local-mode))

ACCEPT-DEFAULT, NO-REMAP, and POSITION are passed to `key-binding'.

(fn KEY &key STATE DOCSTRING LET SETUP TEARDOWN ACCEPT-DEFAULT NO-REMAP POSITION)" nil t) (function-put 'general-key 'lisp-indent-function '1) (autoload 'general-simulate-keys "general" "Deprecated. Please use `general-simulate-key' instead.

(fn KEYS &optional STATE KEYMAP (LOOKUP t) DOCSTRING NAME)" nil t) (autoload 'general-simulate-key "general" "Create and return a command that simulates KEYS in STATE and KEYMAP.

`general-key' should be prefered over this whenever possible as it is simpler
and has saner functionality in many cases because it does not rely on
`unread-command-events' (e.g. \"C-h k\" will show the docstring of the command
to be simulated ; see the readme for more information). The main downsides of
`general-key' are that it cannot simulate a command followed by keys or
subsequent commands, and which-key does not currently work well with it when
simulating a prefix key/incomplete key sequence.

KEYS should be a string given in `kbd' notation. It can also be a list of a
single command followed by a string of the key(s) to simulate after calling that
command. STATE should only be specified by evil users and should be a quoted
evil state. KEYMAP should not be quoted. Both STATE and KEYMAP aliases are
supported (but they have to be set when the macro is expanded). When neither
STATE or KEYMAP are specified, the key(s) will be simulated in the current
context.

If NAME is specified, it will replace the automatically generated function name.
NAME should not be quoted. If DOCSTRING is specified, it will replace the
automatically generated docstring.

Normally the generated function will look up KEY in the correct context to try
to match a command. To prevent this lookup, LOOKUP can be specified as nil.
Generally, you will want to keep LOOKUP non-nil because this will allow checking
the evil repeat property of matched commands to determine whether or not they
should be recorded. See the docstring for `general--simulate-keys' for more
information about LOOKUP.

When a WHICH-KEY description is specified, it will replace the command name in
the which-key popup.

When a command name is specified and that command has been remapped (i.e. [remap
command] is currently bound), the remapped version will be used instead of the
original command unless REMAP is specified as nil (it is true by default).

The advantages of this over a keyboard macro are as follows:
- Prefix arguments are supported
- The user can control the context in which the keys are simulated
- The user can simulate both a named command and keys
- The user can simulate an incomplete key sequence (e.g. for a keymap)

(fn KEYS &key STATE KEYMAP NAME DOCSTRING (LOOKUP t) WHICH-KEY (REMAP t))" nil t) (function-put 'general-simulate-key 'lisp-indent-function 'defun) (autoload 'general-key-dispatch "general" "Create and return a command that runs FALLBACK-COMMAND or a command in MAPS.
MAPS consists of <key> <command> pairs. If a key in MAPS is matched, the
corresponding command will be run. Otherwise FALLBACK-COMMAND will be run with
the unmatched keys. So, for example, if \"ab\" was pressed, and \"ab\" is not
one of the key sequences from MAPS, the FALLBACK-COMMAND will be run followed by
the simulated keypresses of \"ab\". Prefix arguments will still work regardless
of which command is run. This is useful for binding under non-prefix keys. For
example, this can be used to redefine a sequence like \"cw\" or \"cow\" in evil
but still have \"c\" work as `evil-change'. If TIMEOUT is specified,
FALLBACK-COMMAND will also be run in the case that the user does not press the
next key within the TIMEOUT (e.g. 0.5).

NAME and DOCSTRING are optional keyword arguments. They can be used to replace
the automatically generated name and docstring for the created function. By
default, `cl-gensym' is used to prevent name clashes (e.g. allows the user to
create multiple different commands using `self-insert-command' as the
FALLBACK-COMMAND without explicitly specifying NAME to manually prevent
clashes).

When INHERIT-KEYMAP is specified, all the keybindings from that keymap will be
inherited in MAPS.

When a WHICH-KEY description is specified, it will replace the command name in
the which-key popup.

When command to be executed has been remapped (i.e. [remap command] is currently
bound), the remapped version will be used instead of the original command unless
REMAP is specified as nil (it is true by default).

(fn FALLBACK-COMMAND &rest MAPS &key TIMEOUT INHERIT-KEYMAP NAME DOCSTRING WHICH-KEY (REMAP t) &allow-other-keys)" nil t) (function-put 'general-key-dispatch 'lisp-indent-function '1) (autoload 'general-predicate-dispatch "general" "

(fn FALLBACK-DEF &rest DEFS &key DOCSTRING &allow-other-keys)" nil t) (function-put 'general-predicate-dispatch 'lisp-indent-function '1) (autoload 'general-translate-key "general" "Translate keys in the keymap(s) corresponding to STATES and KEYMAPS.
STATES should be the name of an evil state, a list of states, or nil. KEYMAPS
should be a symbol corresponding to the keymap to make the translations in or a
list of keymap names. Keymap and state aliases are supported (as well as 'local
and 'global for KEYMAPS).

MAPS corresponds to a list of translations (key replacement pairs). For example,
specifying \"a\" \"b\" will bind \"a\" to \"b\"'s definition in the keymap.
Specifying nil as a replacement will unbind a key.

If DESTRUCTIVE is non-nil, the keymap will be destructively altered without
creating a backup. If DESTRUCTIVE is nil, store a backup of the keymap on the
initial invocation, and for future invocations always look up keys in the
original/backup keymap. On the other hand, if DESTRUCTIVE is non-nil, calling
this function multiple times with \"a\" \"b\" \"b\" \"a\", for example, would
continue to swap and unswap the definitions of these keys. This means that when
DESTRUCTIVE is non-nil, all related swaps/cycles should be done in the same
invocation.

If both MAPS and DESCTRUCTIVE are nil, only create the backup keymap.

(fn STATES KEYMAPS &rest MAPS &key DESTRUCTIVE &allow-other-keys)" nil nil) (function-put 'general-translate-key 'lisp-indent-function 'defun) (autoload 'general-swap-key "general" "Wrapper around `general-translate-key' for swapping keys.
STATES, KEYMAPS, and ARGS are passed to `general-translate-key'. ARGS should
consist of key swaps (e.g. \"a\" \"b\" is equivalent to \"a\" \"b\" \"b\" \"a\"
with `general-translate-key') and optionally keyword arguments for
`general-translate-key'.

(fn STATES KEYMAPS &rest ARGS)" nil t) (function-put 'general-swap-key 'lisp-indent-function 'defun) (autoload 'general-auto-unbind-keys "general" "Advise `define-key' to automatically unbind keys when necessary.
This will prevent errors when a sub-sequence of a key is already bound (e.g. the
user attempts to bind \"SPC a\" when \"SPC\" is bound, resulting in a \"Key
sequnce starts with non-prefix key\" error). When UNDO is non-nil, remove
advice.

(fn &optional UNDO)" nil nil) (autoload 'general-add-hook "general" "A drop-in replacement for `add-hook'.
Unlike `add-hook', HOOKS and FUNCTIONS can be single items or lists. APPEND and
LOCAL are passed directly to `add-hook'. When TRANSIENT is non-nil, each
function will remove itself from the hook it is in after it is run once. If
TRANSIENT is a function, call it on the return value in order to determine
whether to remove a function from the hook. For example, if TRANSIENT is
#'identity, remove each function only if it returns non-nil. TRANSIENT could
alternatively check something external and ignore the function's return value.

(fn HOOKS FUNCTIONS &optional APPEND LOCAL TRANSIENT)" nil nil) (autoload 'general-remove-hook "general" "A drop-in replacement for `remove-hook'.
Unlike `remove-hook', HOOKS and FUNCTIONS can be single items or lists. LOCAL is
passed directly to `remove-hook'.

(fn HOOKS FUNCTIONS &optional LOCAL)" nil nil) (autoload 'general-advice-add "general" "A drop-in replacement for `advice-add'.
SYMBOLS, WHERE, FUNCTIONS, and PROPS correspond to the arguments for
`advice-add'. Unlike `advice-add', SYMBOLS and FUNCTIONS can be single items or
lists. When TRANSIENT is non-nil, each function will remove itself as advice
after it is run once. If TRANSIENT is a function, call it on the return value in
order to determine whether to remove a function as advice. For example, if
TRANSIENT is #'identity, remove each function only if it returns non-nil.
TRANSIENT could alternatively check something external and ignore the function's
return value.

(fn SYMBOLS WHERE FUNCTIONS &optional PROPS TRANSIENT)" nil nil) (autoload 'general-add-advice "general") (autoload 'general-advice-remove "general" "A drop-in replacement for `advice-remove'.
Unlike `advice-remove', SYMBOLS and FUNCTIONS can be single items or lists.

(fn SYMBOLS FUNCTIONS)" nil nil) (autoload 'general-remove-advice "general") (autoload 'general-evil-setup "general" "Set up some basic equivalents for vim mapping functions.
This creates global key definition functions for the evil states.
Specifying SHORT-NAMES as non-nil will create non-prefixed function
aliases such as `nmap' for `general-nmap'.

(fn &optional SHORT-NAMES _)" nil nil) (if (fboundp 'register-definition-prefixes) (register-definition-prefixes "general" '("general-"))) (provide 'general-autoloads))))

#s(hash-table size 65 test eq rehash-size 1.5 rehash-threshold 0.8125 data (org-elpa #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 9 "melpa" nil "gnu-elpa-mirror" nil "el-get" nil "emacsmirror-mirror" nil "straight" nil "use-package" nil "bind-key" nil "evil" nil "goto-chg" nil "cl-lib" nil "command-log-mode" nil "ivy" nil "doom-themes" nil "general" nil)) melpa #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 2 "gnu-elpa-mirror" nil "el-get" (el-get :type git :flavor melpa :files ("*.el" ("recipes" "recipes/el-get.rcp") "methods" "el-get-pkg.el") :host github :repo "dimitri/el-get") "emacsmirror-mirror" nil "straight" nil "use-package" (use-package :type git :flavor melpa :files (:defaults (:exclude "bind-key.el" "bind-chord.el" "use-package-chords.el" "use-package-ensure-system-package.el") "use-package-pkg.el") :host github :repo "jwiegley/use-package") "bind-key" (bind-key :type git :flavor melpa :files ("bind-key.el" "bind-key-pkg.el") :host github :repo "jwiegley/use-package") "evil" (evil :type git :flavor melpa :files (:defaults "doc/build/texinfo/evil.texi" (:exclude "evil-test-helpers.el") "evil-pkg.el") :host github :repo "emacs-evil/evil") "goto-chg" (goto-chg :type git :flavor melpa :host github :repo "emacs-evil/goto-chg") "cl-lib" nil "command-log-mode" (command-log-mode :type git :flavor melpa :host github :repo "lewang/command-log-mode") "ivy" (ivy :type git :flavor melpa :files (:defaults (:exclude "swiper.el" "counsel.el" "ivy-hydra.el" "ivy-avy.el") "doc/ivy-help.org" "ivy-pkg.el") :host github :repo "abo-abo/swiper") "doom-themes" (doom-themes :type git :flavor melpa :files (:defaults "themes/*.el" "doom-themes-pkg.el") :host github :repo "hlissner/emacs-doom-themes") "general" (general :type git :flavor melpa :host github :repo "noctuid/general.el"))) gnu-elpa-mirror #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 3 "emacsmirror-mirror" nil "straight" nil "cl-lib" nil)) el-get #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 1 "emacsmirror-mirror" nil "straight" nil "cl-lib" nil)) emacsmirror-mirror #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8125 data (version 2 "straight" (straight :type git :host github :repo "emacsmirror/straight") "cl-lib" nil))))

("org-elpa" "melpa" "gnu-elpa-mirror" "el-get" "emacsmirror-mirror" "straight" "emacs" "use-package" "bind-key" "evil" "goto-chg" "cl-lib" "command-log-mode" "ivy" "doom-themes" "general")

t
