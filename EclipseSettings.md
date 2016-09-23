#Eclipse Settings

The following is a list of settings I like to change in Eclipse. These settings are contained in the file `EclipseConfig.epf` and can be imported using File:Import:General:Preferences:Next >:Browse:`EclipseConfig.epf`. Unless otherwise noted, settings are modified from Windows:Preferences
- General:Editors:Size of recently opened files -> 15
- General:Editors:Text Editors
  - Displayed tab width -> 3
  - Insert spaces for tabs -> checked
  - Show print margin -> checked
- General:Editors:Text Editors:Spelling:User defined dictionary -> ./workspace_eclipse/dictionary.txt
- General:Startup and Shutdown:"RSE UI" -> uncheck
- General:Workspace:Save automatically before build -> checked
- C/C++:Build:Console
  - Bring console to top when building (if present) -> checked
  - Wrap lines on the console -> checked
  - Display tab width -> 3
- C/C++:Code Style: 
  - Code Templates:Comments:Files:Pattern
    - [Add boilerplate copyright here](https://raw.githubusercontent.com/fsziegler/Configurations/master/EclipseCopyright.txt)
    - [Add boilerplate TODOs here](https://raw.githubusercontent.com/fsziegler/Configurations/master/ToDo.txt)
  - Code Templates:Comments:Code:Class body
    - Insert `// The class ${enclosing_type} ..` on the line before "${declarations}"
  - Formatter:
    - Set to BSD/Allman, and edit:
      - Rename to "BSD/Allman [Fred]"
      - Indentation Tab:
        - Tab Policy -> Spaces Only
        - Indentation size -> 3
        - Tab size -> 3
    - New Lines Tab:Insert new line:before colon in constructor initializer list -> checked
    - Line Wrapping Tab:
      - Function declarations:Constructor initializer list:
        - Line wrapping policy -> Wrap all elements, except first element if not necessary
        - Force split, even if line is shorter than maximum width -> checked
        - Indentation policy -> Indent on column
      - 'enum' declaration:Enumerator list:Line wrapping policy:Force split, even if line is shorter than maximum width -> checked
      - Expressions:Initializer List:Line wrapping policy -> Wrap all elements, every element on a new line
      - Expressions:Member access:Line wrapping policy -> Wrap only when necessary
  - Name Style:Code:
    - Constant:
      - Capitalization -> CamelCase
      - Prefix -> k
    - Class Field:Prefix -> m_
- C/C++:Editor:Folding: Enable folding of control flow statements (if/else, do/while, for, switch) -> checked
- Team:Git:Default repository folder: *path to repo*

##Tooltips
If running Kubuntu, the error tooltips in the editor may appear black on black. To fix this,
- Run System Settings
- Click on Application Appearance in Common Appearance and Behaviour
- Click on Colours icon and then on Colours tab
- Find Tooltip Background and choose a bright color, for instance pale yellow or white
- Find Tooltip Text below and choose a darker color, like blue or black
- Click Apply
- Restart Eclipse

(Fix copied from http://askubuntu.com/questions/45001/how-to-fix-black-tooltips-in-eclipse)

##To link Boost unit testing in EclipseCDT Mars
Under Project Properties->C/C++ General:Paths and Symbols:Libraries:Configuration:[All Configurations] flags
- Add `boost_unit_test_framework`
- Check "Add to all languages"

##To build with C++11 properly in EclipseCDT Mars (replace `-std=c++11` with `-std=gnu++11` for MinGW)

Under Project Properties->C/C++ Build:Settings:Tool Settings:GCC C++ Compiler:Miscellaneous:Other flags, add `-std=c++11`

Under Project Properties->C/C++ Build:Settings:Tool Settings:GCC C Compiler:Miscellaneous:Other flags, add `-std=c++11`

Under Project Properties->C/C++ Build:Settings:Tool Settings:GCC C++ Linker:Miscellaneous:Linker flags, add `-std=c++11`

##To index C++11 properly in EclipseCDT Mars

"Under Project Properties->C/C++ General->Preprocessor Include Paths, Macros->[Providers] tab->your Built-in Compiler Settings provider (toolchain dependent).
Click on "Workspace Settings" link which gets you to "Settings" property page, select [Discovery] tab and your provider again. There is "Command to get compiler specs", add `-std=c++11` in there."

(From: http://www.eclipse.org/forums/index.php/mv/msg/373462/909018/#msg_909018)
