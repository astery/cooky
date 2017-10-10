defmodule CookyWeb.InterestingTest do
  use CookyWeb.ChannelCase

  alias Cooky.Chef
  alias Cooky.Fixture
  alias CookyWeb.CookingChannel

  setup do
    batter = Fixture.create_ingredient_type("batter")
    _regular_batter = Fixture.create_ingredient("regular batter", batter)

    :ok
  end

  test "run in test process", %{} do
    assert [_item] = Chef.all_ingridients()
  end

  # fails
  test "run in genserver process", %{} do
    assert [_item] = Chef.all_ingridients_in_gc()
  end
end
