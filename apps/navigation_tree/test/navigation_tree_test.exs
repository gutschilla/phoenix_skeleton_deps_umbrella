defmodule NavigationTreeTest do
  use ExUnit.Case

  test "traversing the tree" do
    tree = NavigationTree.Example.tree;
    assert tree.name == "MYHome";
    {:ok, login } = Enum.fetch tree.children, 0;
    assert login.name == "MYLogin";
    # same in a complex notation
    assert ( tree.children |> Enum.fetch(1) |> elem 1 ).name == "MYAdmin"
  end
  
  test "allowed tree" do
    tree       = NavigationTree.Example.allowed_tree([])
    admin_tree = NavigationTree.Example.allowed_tree(["admin"]);
    assert length( admin_tree.children ) == 2
    # there must be missing the admin section
    assert length( tree.children ) == 1
  end
  
end
