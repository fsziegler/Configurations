#Installing and using Qt Creator
[Qt Creator](http://www.qt.io/ide/) is a [C++](https://en.wikipedia.org/wiki/C%2B%2B) [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment) that enables developers to write cross-platform code that can be compiled for all the major consumer OSes, including Windows, Linux, FreeBSD, Mac OS, Android, BlackBerry, Maemo, and MeeGo and embedded Linux devices ([Wikipedia](https://en.wikipedia.org/wiki/Qt_Creator#Targets)).

The current installation of Qt Creator on Linux has a few quirks, whose solutions are outlines here.

- Clicking the help button results in an error page stating, "The page could not be found!"
  - Solution (from https://bugs.launchpad.net/ubuntu/+bug/1356515):
    - Open Qt Creator > Tools > Options > Help > Documentation
    - Click Add, navigate to `/usr/share/qtcreator/doc/`, choose `qtcreator.qch`, and click OK
    - Restart Qt Creator, and the help will show properly
- When running in debug mode, the following error message appears:
  - Debugging Helper Missing
  - The debugger could not load the debugging helper library.
  - The debugging helper is used to nicely format the values of some Qt and Standard Library data types. It must be compiled for each used Qt version separately. In the Qt Creator Build and Run preferences page, select a Qt version, expand the Details section and click Build All.
  
History of successful installation of QtCreator and GDB that supports Python for debugging:
  106  aptitude search python
  107  aptitude search --help
  108  aptitude search python > ../python.txt
  109  exit
  110  exit
  111  cd dev/
  112  cd GTD-Kanban/
  113  aptitude search python > ../python.txt
  114  aptitude search --help
  115  aptitude -w 150 search python > ../python.txt
  116  python --help
  117  python -V
  118  sudo apt-get install python3
  119  sudo apt-get install python3.4
  120  aptitude -w 150 search cmake
  121  sudo apt-get install qtcreator-plugin-cmake-dev
  122  g++ -v
  123  g++ -V
  124  g++ --version
  125  ll /usr/bin/ | grep gdb
  126  aptitude search python | grep dev
  127  python --version
  128  sudo apt-get install python2.7-dev
  129  gdb
  130  gdb --with-python
  131  gdb --version
  132  aptitude search gdb
  133  aptitude search gdb | grep ython
  134  gdb show data-directory
  135  gdb ./configure --with-python
  136  aptitude search python | grep -dev
  137  aptitude search python | grep dev
  138  sudo apt-get install python3-all-dev
  139  qtcreator &
  140  aptitude search devtoolset-3
  141  aptitude search creator
  142  cd ..
  143  git clone git@github.com:qtproject/qt-creator.git
  144  ll
  145  cd qt-creator/
  146  ll
  147  qmake -r
  148  qmake --help
  149  qmake -v
  150  aptitude search qmake
  151  aptitude search qt
  152  aptitude search qt | grep "i A"
  153  aptitude search qt | grep 5
  154  qmake -r
  155  cd ..
  156  mkdir qt-5.4.2
  157  cd qt-5.4.2/
  158  wget http://download.qt.io/official_releases/qt/5.4/5.4.2/qt-opensource-linux-x86-5.4.2.run
  159  ll
  160  chmod +x qt-opensource-linux-x86-5.4.2.run 
  161  ./qt-opensource-linux-x86-5.4.2.run 
  162  aptitude search qt-creator
  163  ./qt-opensource-linux-x86-5.4.2.run 
  164  aptitude search gdb
  165  aptitude search gdb | grep python
  166  gdb 
  167  gdb --version
  168  cd ..
  169  mkdir gdb
  170  cd gdb
  171  wget http://ftp.gnu.org/gnu/gdb/gdb-7.10.tar.gz
  172  ll
  173  cd gdb-7.10/
  174  ll
  175  find . -name gdb
  176  ./gdb/gdb
  177  cd gdb
  178  ll
  179  cd ..
  180  ll
  181  ./configure --prefix /usr/local/gdb-python2 --with-python
  182  make
  183  make install
  184  sudo make install
  185  sudo apt-get install texinfo
  186  sudo make install
  187  gdb
  188  gdb --version
  189  ll
  190  find . -name gdb
  191  ./gdb/gdb
  192  cd ..
  193  find ~ -name debuggers.xml@
  194  find ~ -name debuggers.xml
  195  gedit /home/fred/dev/qt-creator/tests/system/settings/unix/QtProject/qtcreator/debuggers.xml
  196  history 30
  197  qtcreator
  198  find ~ -name qtcreator
  199  /home/fred/apps/Qt5.4.2/Tools/QtCreator/bin/qtcreator &
  200  find ~ -name debuggers.xml
  201  gedit /home/fred/.config/QtProject/qtcreator/debuggers.xml
  202  /home/fred/apps/Qt5.4.2/Tools/QtCreator/bin/qtcreator &
  203  history > hist.txt
