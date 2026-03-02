The purpose of this folder is to host the plugin downloads and determine how Lazy handles them (loading prio etc).

The configuration (setup) files are located in the user/[plugin_name] directories.

So the setup is something like the following:

	plugins/[plugin_name].lua      → installation + load timing
	user/[plugin_name]/init.lua    → setup()
	user/[plugin_name]/*.lua       → behavior & structure
