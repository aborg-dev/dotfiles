(local core (require :nfnl.core))

(fn group [keys desc]
  {1 keys :group desc})

(fn bind [keys cmd desc]
  {1 keys 2 cmd : desc})

(fn bind_group [prefix group_name bindings]
  [(group prefix group_name)
   (icollect [key binding (pairs bindings)]
     (bind (.. prefix key) (core.first binding) (core.second binding)))])

{:bind bind_group}

