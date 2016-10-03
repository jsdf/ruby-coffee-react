ruby-coffee-react
=================

# STATUS: DEPRECATED

This tool is no longer maintained. If you need to transition your codebase from
it, a codemod is available to do so: [cjsx-codemod](https://github.com/jsdf/cjsx-codemod)

This project started as a way for me to explore how JSX could fit into
Coffeescript syntax, as a quickly hacked together prototype. While I never
really promoted it, it quickly took on a life of its own, and before long people
were asking for it to support all kinds of different use cases. On top of that I
had no experience writing parsers, so the result is something with 
[insurmountable limitations](https://github.com/jsdf/coffee-react/issues/32).

As I eventually stopped using Coffeescript I ended up neglecting this project,
but as people were using it I didn't want to kill it. I really should have,
however, because it meant that people were using a crappy, ill-conceived,
unmaintained tool. Now, long overdue, I'm putting it out to pasture.

Original readme follows:

`ruby-coffee-react` is a bridge to the npm [coffee-react-transform](https://github.com/jsdf/coffee-react-transform) module.

    CoffeeReact.transform File.open("component.cjsx")


Installation
------------

    gem install coffee-react


Compatibility
------------
The version numbers of this gem follow those of the `coffee-react-transform` npm 
package. See information about [compatibility with different versions of React](https://github.com/jsdf/coffee-react-transform#version-compatibility).

Dependencies
------------

### JSON

The `json` library is also required but is not explicitly stated as a
gem dependency. If you're on Ruby 1.8 you'll need to install the
`json` or `json_pure` gem. On Ruby 1.9, `json` is included in the
standard library.

### ExecJS

The [ExecJS](https://github.com/sstephenson/execjs) library is used to automatically choose the best JavaScript engine for your platform. Check out its [README](https://github.com/sstephenson/execjs/blob/master/README.md) for a complete list of supported engines.

This gem has been tested against the following ExecJS runtimes: Node, RubyRacer, JavaScriptCore. If you encounter any problems with these or any other ExecJS runtimes, please [create a issue](https://github.com/jsdf/ruby-coffee-react/issues).
