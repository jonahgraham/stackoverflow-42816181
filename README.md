The problem you are facing is *how* the linked folders are being represented in your project (virtual vs. non-virtual) and how the `-I` argument is being resolved.

The Import filesystem wizard does a very different thing when choosing *Create virtual folders* or not.

*Create virtual folders* checked.
----

In this case all the intermediary folders are virtual, i.e. they don't correspond to the folders on the file system. You can see this in a few places:

1. The icon overlay is a blank square: 

[![enter image description here][1]][1]

2. Adding a file to that directory on the file system will not make the file appear in the IDE. This is because the individual files are linked, not their containing folders.
3. You can see this in the project properties like this:

[![enter image description here][2]][2]

**Effect** These folders are virtual, they don't correspond to anything actually on disk, so there is no equivalent at build time to pass to GCC, so they are omitted.




*Create virtual folders* unchecked.
----

In this case the link is to just the root element. You can see this in a few place:

1. The icon overlay is a shortcut type arrow: 

[![enter image description here][3]][3]

2. Adding a file to that directory on the file system will make the file appear in the IDE. 
3. You can see this in the project properties like this:

[![enter image description here][4]][4]

**Effect** These folders are linked, so they correspond to something on disk, therefore at build time they are passed through.

Final Complication
------

The last complication is that `"/${ProjName}/src/bar/inc"` is not the correct way to refer to the path. You are constructing arguments for GCC here, so you have to resolve to from the workspace representation of the location to the location on disk. Therefore, surround the whole thing with the `workspace_loc` variable `"${workspace_loc:/${ProjName}/src/bar/inc}"`

    "/${ProjName}/src/bar" -> /foo/src/bar/inc
    "${workspace_loc:/${ProjName}/src/bar/inc}" -> /tmp/so/git/bar/inc



  [1]: https://i.stack.imgur.com/GUiYp.png
  [2]: https://i.stack.imgur.com/XYCWi.png
  [3]: https://i.stack.imgur.com/t1nAY.png
  [4]: https://i.stack.imgur.com/NO7NN.png

