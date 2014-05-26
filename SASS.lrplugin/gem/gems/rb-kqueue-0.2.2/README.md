# rb-kqueue

This is a simple wrapper over the [kqueue](http://en.wikipedia.org/wiki/Kqueue)
BSD event notification interface (supported on FreeBSD, NetBSD, OpenBSD, and Darwin).
It uses the [FFI](http://wiki.github.com/ffi/ffi) gem to avoid having to compile a C extension.

[API documentation is available on rdoc.info](http://rdoc.info/projects/mat813/rb-kqueue).

## Usage

The API is similar to the kqueue C API, but with a more Rubyish feel.
First, create a queue:

    queue = KQueue::Queue.new

Then, tell it to watch the events you're interested in:

    queue.watch_file("path/to/foo.txt", :write) {puts "foo.txt was modified!"}
    queue.watch_process(Process.pid, :fork, :exec) do |event|
      puts "This process has #{event.flags.map {|f| f.to_s + "ed"}.join(" and ")}"
    end

KQueue can monitor for all sorts of events.
For a full list, see the `watch_*` methods on {Queue}.

Finally, run the queue:

    queue.run

This will loop infinitely, calling the appropriate callbacks when the events are fired.
If you don't want infinite looping,
you can also block until there are available events,
process them all at once,
and then continue on your merry way:

    queue.process

## Contributing

### Bug Reports

They all go in the github [issue tracker], no exception. (Well, the exception
is when you have a patch, in that case, it goes into the github [pull requests]
thingie.)

If you get a weird compilation error, it's most certainely a problem in
[ffi/ffi] but do report it anyway so I can get a look at it.

Do get me the result of `uname -a` somewhere so that we know what OS and what
version we're talking about.

Also, please, try to answer the following questions :

- What did you do?
- What did you expect to happen?
- What happened instead?

Please also post code to replicate the bug. Ideally a failing test would be
perfect, (one day there will be tests,) but even a simple script demonstrating
the error would suffice. Please don't send me an entire application, unless the
bug is in the *interaction* between rb-kqueue and a particular framework.

Make sure to specify which version of rb-kqueue you are using.

### Pull Requests

- **Document any change in behaviour**. Make sure the README and any other
  relevant documentation are kept up-to-date.

- **Consider our release cycle**. We try to follow semver. Randomly breaking
  public APIs is not an option.

- **Create topic branches**. Don't ask us to pull from your master branch.

- **One pull request per feature**. If you want to do more than one thing, send
  multiple pull requests.

- **Send coherent history**. Make sure each individual commit in your pull
  request is meaningful. If you had to make multiple intermediate commits while
  developing, please try to squash them before sending them to us. I quite like
  [tpope]'s [general guidelines], they're not absolute rules, but do try not to
  put all your commit message on the [first line].

- And if you feel like it, **Add tests!**, rspecs would be nice :-)


[issue tracker]: https://github.com/mat813/rb-kqueue/issues
[pull requests]: https://github.com/mat813/rb-kqueue/pulls
[ffi/ffi]: https://github.com/ffi/ffi
[tpope]: https://github.com/tpope
[general guidelines]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[first line]: http://stopwritingramblingcommitmessages.com/
