(fn group [keys desc]
  {1 keys :group desc})

(fn bind [keys cmd desc ?mode]
  {1 keys 2 cmd : desc :mode (or ?mode :n)})

(fn bind_group [prefix group_name bindings]
  [(group prefix group_name)
   (icollect [key binding (pairs bindings)]
     (bind (.. prefix key) (. binding 1) (. binding 2) (. binding 3)))])

{:bind bind_group}

