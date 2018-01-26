# kali conf
git clone https://github.com/omiao/kali-conf
cd kali-confi
cp -fr \.* ~

Installation
1. vim part:
	1) vim
If Bundle not automatically installed, run:
	2). git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle

	3). run: bundleInstall in vim
	4). Install YouCompleteMe:
		cygwin: 
		cd ~/.vim/bundle/YouCompleteMe
		mkdir build && cd build
		cmake -G "Unix Makefiles" -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.dll.a -DCMAKE_CXX_COMPILER=g++ . ../third_party/ycmd/cpp
		change SIZEOF_LONG to 8 in ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/BoostParts/boost/python/detail/wrap_python.hpp 
		make ycm_core
		make ycm_client_support
		cp ~/.vim/bundle/YouCompleteMe/build_cygwin/ycm/libycm_core.dll.a ycm_core.dll
		cp ~/.vim/bundle/YouCompleteMe/build_cygwin/ycm/libycm_client_support.dll.a ycm_client_support.dll
		cd .. && ./install.sh
		Linux:
		./install.sh

2. tmux part: 
Install: prefix b ; source-file ~/.tmux.conf

3. bashrc part:
Install: source .bashrc
