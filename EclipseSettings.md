#Eclipse Settings

The following is a list of settings I like to change in Eclipse. Unless otherwise noted, settings are modified from Windows:Preferences
- General:Editors:Size of recently opened files -> 15
- General:Editors:Text Editors
  - Displayed tab width -> 3
  - Insert spaces for tabs -> checked
  - Show print margin -> checked
- General:Editors:Text Editors:Spelling:User defined dictionary -> ./workspace_eclipse/dictionary.txt
- General:Workspace:Save automatically before build -> checked
- C/C++:Build:Console
  - Bring console to top when building (if present) -> checked
  - Wrap lines on the console -> checked
  - Display tab width -> 3
- C/C++:Build:Code Style:
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
        - Line wrapping policy -> Wrap all elements, every element on its own line
        - Force split, even if line is shorter than maximum width -> checked
        - Indentation policy -> Indent on column
      - 'enum' declaration:Enumerator list:Line wrapping policy:Force split, even if line is shorter than maximum width -> checked
      - Expressions:Member access:Line wrapping policy -> Wrap only when necessary
  - Name Style:Code:
    - Constant:
      - Capitalization -> CamelCase
      - Prefix -> k
    - Class Field:Prefix -> m_
  - Team:Git:Default repository folder: *path to repo*

If running Kubuntu, the error tooltips in the editor may appear black on black. To fix this,
- Run System Settings
- Click on Application Appearance in Common Appearance and Behaviour
- Click on Colours icon and then on Colours tab
- Find Tooltip Background and choose a bright color, for instance pale yellow or white
- Find Tooltip Text below and choose a darker color, like blue or black
- Click Apply
- Restart Eclipse

(Fix copied from http://askubuntu.com/questions/45001/how-to-fix-black-tooltips-in-eclipse)
