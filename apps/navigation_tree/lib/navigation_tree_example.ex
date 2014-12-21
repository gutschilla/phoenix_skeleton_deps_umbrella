defmodule NavigationTree.Example do

  # TODO: auto-gerenerate this as macro instead of having this boilerplate code

  import NavigationTree.Node;
  alias NavigationTree.Node, as: Node;
  alias NavigationTree, as: SUPER;

  # here goes your actual Tree:
  def config do
      %Node{
          name: "MYHome",
          children: [
              %Node{
                  name: "MYLogin",
                  url:  "/auth",
              },
              %Node{
                  name: "MYAdmin",
                  roles: ["admin"],
                  children: [
                      %Node{ name: "MYUsers" },
                      %Node{ name: "MYRoles" },
                  ]
              }
          ]
      }
  end

  def tree do
    SUPER.thaw config
  end
  
  def allowed_tree( userroles ) do
    SUPER.allowed_tree( userroles, tree() )
  end
  
  def as_list do
      # using as_list2, now
      SUPER.as_list tree, 0
  end

end